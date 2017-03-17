# -*- coding: utf-8 -*-

import numpy as np
import tensorflow as tf

from inferbeddings.models import base as models
from inferbeddings.models import similarities
from inferbeddings.knowledgebase import Fact, KnowledgeBaseParser
from inferbeddings.parse import parse_clause
from inferbeddings.models.training import constraints

from inferbeddings.adversarial import Adversarial

import pytest


def dot3(a, b, c):
    return np.sum(a * b * c)


def score(subject_embedding, predicate_embedding, object_embedding):
    n = subject_embedding.shape[0]
    s_re, s_im = subject_embedding[:n // 2], subject_embedding[n // 2:]
    p_re, p_im = predicate_embedding[:n // 2], predicate_embedding[n // 2:]
    o_re, o_im = object_embedding[:n // 2], object_embedding[n // 2:]
    return dot3(s_re, p_re, o_re) + dot3(s_re, p_im, o_im) + dot3(s_im, p_re, o_im) - dot3(s_im, p_im, o_re)


triples = [
    ('a', 'p', 'b'),
    ('c', 'p', 'd'),
    ('a', 'q', 'b')
]
facts = [Fact(predicate_name=p, argument_names=[s, o]) for s, p, o in triples]
parser = KnowledgeBaseParser(facts)

nb_entities = len(parser.entity_to_index)
nb_predicates = len(parser.predicate_to_index)

entity_embedding_size = 2
predicate_embedding_size = 2

# Clauses
clause_str = 'q(X, Y) :- p(Y, X)'
clauses = [parse_clause(clause_str)]

# Instantiating the model parameters
model_class = models.get_function('ComplEx')
similarity_function = similarities.get_function('dot')

model_parameters = dict(similarity_function=similarity_function)


def test_complex_unit_cube():
    for seed in range(8192):
        tf.reset_default_graph()

        np.random.seed(seed)
        tf.set_random_seed(seed)

        # Instantiating entity and predicate embedding layers
        entity_embedding_layer = tf.get_variable('entities',
                                                 shape=[nb_entities + 1, entity_embedding_size],
                                                 initializer=tf.contrib.layers.xavier_initializer())

        predicate_embedding_layer = tf.get_variable('predicates',
                                                    shape=[nb_predicates + 1, predicate_embedding_size],
                                                    initializer=tf.contrib.layers.xavier_initializer())

        # Adversary - used for computing the adversarial loss
        adversarial = Adversarial(clauses=clauses, parser=parser,
                                  entity_embedding_layer=entity_embedding_layer,
                                  predicate_embedding_layer=predicate_embedding_layer,
                                  model_class=model_class,
                                  model_parameters=model_parameters,
                                  batch_size=1)

        adv_projection_steps = [constraints.unit_cube(adv_emb_layer) for adv_emb_layer in adversarial.parameters]

        v_errors, v_loss = adversarial.errors, adversarial.loss

        v_optimizer = tf.train.AdagradOptimizer(learning_rate=1e-1)
        v_training_step = v_optimizer.minimize(- v_loss, var_list=adversarial.parameters)

        init_op = tf.global_variables_initializer()

        p_idx, q_idx = parser.predicate_to_index['p'], parser.predicate_to_index['q']

        p_emb = tf.nn.embedding_lookup(predicate_embedding_layer, p_idx)
        q_emb = tf.nn.embedding_lookup(predicate_embedding_layer, q_idx)

        with tf.Session() as session:
            session.run(init_op)
            predicate_embedding_layer_value = session.run([predicate_embedding_layer])[0]

            p_emb_val, q_emb_val = session.run([p_emb, q_emb])

            # "Analytically" computing the best adversarial embeddings
            opt_emb_s = np.zeros(entity_embedding_size)
            opt_emb_o = np.zeros(entity_embedding_size)

            n = entity_embedding_size
            for j in range(n // 2):
                candidates = [
                    #(0., 0., 0., 0.), (0., 1., 0., 0.), (1., 0., 0., 0.), (1., 1., 0., 0.),
                    #(0., 0., 0., 1.), (0., 1., 0., 1.), (1., 0., 0., 1.), (1., 1., 0., 1.),
                    #(0., 0., 1., 0.), (0., 1., 1., 0.), (1., 0., 1., 0.), (1., 1., 1., 0.),
                    #(0., 0., 1., 1.), (0., 1., 1., 1.), (1., 0., 1., 1.), (1., 1., 1., 1.),
                    (1.0, 1.0, 1.0, 1.0), (1.0, 1.0, 0.0, 1.0), (1.0, 1.0, 1.0, 0.0),
                    (0.0, 1.0, 1.0, 0.0), (1.0, 0.0, 0.0, 1.0)
                ]
                highest_loss_value, best_candidate = None, None
                for (sR_j, oR_j, sI_j, oI_j) in candidates:
                    _opt_emb_s, _opt_emb_o = np.copy(opt_emb_s), np.copy(opt_emb_o)
                    _opt_emb_s[j], _opt_emb_o[j] = sR_j, oR_j
                    _opt_emb_s[(n // 2) + j], _opt_emb_o[(n // 2) + j] = sI_j, oI_j
                    loss_value = score(_opt_emb_o, p_emb_val, _opt_emb_s) - score(_opt_emb_s, q_emb_val, _opt_emb_o)
                    if highest_loss_value is None or loss_value > highest_loss_value:
                        highest_loss_value = loss_value
                        best_candidate = (sR_j, oR_j, sI_j, oI_j)
                print('XXX', best_candidate)
                opt_emb_s[j], opt_emb_o[j] = best_candidate[0], best_candidate[1]
                opt_emb_s[(n // 2) + j], opt_emb_o[(n // 2) + j] = best_candidate[2], best_candidate[3]

            assert len(adversarial.parameters) == 2
            session.run([adversarial.parameters[0][0, :].assign(opt_emb_s)])
            session.run([adversarial.parameters[1][0, :].assign(opt_emb_o)])

            for projection_step in adv_projection_steps:
                session.run([projection_step])

            v_opt_errors_val, v_opt_loss_val = session.run([v_errors, v_loss])

            session.run(init_op)
            session.run([predicate_embedding_layer.assign(predicate_embedding_layer_value)])

            for finding_epoch in range(1, 100 + 1):
                _ = session.run([v_training_step])

                for projection_step in adv_projection_steps:
                    session.run([projection_step])

                v_errors_val, v_loss_val = session.run([v_errors, v_loss])

                print('{} <= {}'.format(v_loss_val, v_opt_loss_val))

                assert v_opt_errors_val >= v_errors_val
                assert v_opt_loss_val >= v_loss_val

if __name__ == '__main__':
    pytest.main([__file__])