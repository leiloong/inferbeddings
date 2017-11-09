# -*- coding: utf-8 -*-

from collections import Counter

import pytest

from inferbeddings.lm.legacy.loader import TextLoader


def test_build_vocab():
    data_loader = TextLoader("tests/data/cat/", batch_size=2, seq_length=5)

    sentences = ["I", "love", "cat", "cat"]
    vocab, vocab_inv = data_loader.build_vocabulary(sentences)

    assert Counter(list(vocab)) == Counter(list(["I", "love", "cat"]))
    assert vocab == {'I': 0, 'love': 2, 'cat': 1}
    assert Counter(list(vocab_inv)) == Counter(list(["I", "love", "cat"]))


def test_batch_vocab():
    data_loader = TextLoader("tests/data/cat/", batch_size=2, seq_length=5)

    assert Counter(list(data_loader.x_batches[0][0][1:])) == Counter(list(data_loader.y_batches[0][0][:-1]))
    assert Counter(list(data_loader.x_batches[0][1][1:])) == Counter(list(data_loader.y_batches[0][1][:-1]))


if __name__ == '__main__':
    pytest.main([__file__])