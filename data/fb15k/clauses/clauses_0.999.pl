/olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/olympics(X0, X2) :- /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/medal(X1, X0), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X2)
/olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/olympics(X0, X2) :- /olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/country(X0, X1), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X2)
/olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/olympics(X0, X2) :- /olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/country(X0, X1), /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X2, X1)
/olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/olympics(X0, X2) :- /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/medal(X1, X0), /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X2, X1)
/location/hud_county_place/place(X0, X1) :- /location/hud_county_place/place(X1, X0)
/location/hud_county_place/place(X0, X2) :- /location/hud_county_place/place(X1, X0), /location/hud_county_place/place(X2, X1)
/location/hud_county_place/place(X0, X2) :- /location/hud_county_place/place(X0, X1), /location/hud_county_place/place(X2, X1)
/location/hud_county_place/place(X0, X2) :- /location/hud_county_place/place(X0, X1), /location/hud_county_place/place(X1, X2)
/location/hud_county_place/place(X0, X2) :- /location/hud_county_place/place(X1, X0), /location/hud_county_place/place(X1, X2)
/olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/olympics(X0, X2) :- /olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/country(X0, X1), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X2)
/olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/olympics(X0, X2) :- /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X0), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X2)
/olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/olympics(X0, X2) :- /olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/country(X0, X1), /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X2, X1)
/olympics/olympic_sport/athletes./olympics/olympic_athlete_affiliation/olympics(X0, X2) :- /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X0), /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X2, X1)
/education/educational_institution_campus/educational_institution(X0, X1) :- /education/educational_institution_campus/educational_institution(X1, X0)
/education/educational_institution_campus/educational_institution(X0, X2) :- /education/educational_institution_campus/educational_institution(X1, X0), /education/educational_institution_campus/educational_institution(X2, X1)
/education/educational_institution_campus/educational_institution(X0, X2) :- /education/educational_institution_campus/educational_institution(X0, X1), /education/educational_institution_campus/educational_institution(X2, X1)
/education/educational_institution_campus/educational_institution(X0, X2) :- /education/educational_institution_campus/educational_institution(X0, X1), /education/educational_institution_campus/educational_institution(X1, X2)
/education/educational_institution_campus/educational_institution(X0, X2) :- /education/educational_institution_campus/educational_institution(X1, X0), /education/educational_institution_campus/educational_institution(X1, X2)
/base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X2) :- /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X1, X0), /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X2, X1)
/base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X2) :- /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X1), /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X2, X1)
/base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X2) :- /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X1), /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X1, X2)
/base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X0, X2) :- /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X1, X0), /base/saturdaynightlive/snl_cast_member/seasons./base/saturdaynightlive/snl_season_tenure/cast_members(X1, X2)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/produce/availability./base/localfood/produce_availability/seasonal_months(X1, X0), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/produce(X2, X1)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/produce(X0, X1), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/produce(X2, X1)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X1, X0), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X2, X1)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X1), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X2, X1)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/produce(X0, X1), /base/localfood/produce/availability./base/localfood/produce_availability/seasonal_months(X1, X2)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X1), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X1, X2)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X1, X0), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X1, X2)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X1, X0), /travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X1, X2)
/base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X0, X2) :- /base/localfood/produce/availability./base/localfood/produce_availability/seasonal_months(X1, X0), /base/localfood/produce/availability./base/localfood/produce_availability/seasonal_months(X1, X2)
/travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X0, X2) :- /travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X0, X1), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X1, X2)
/travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X0, X2) :- /travel/travel_destination/climate./travel/travel_destination_monthly_climate/month(X0, X1), /base/localfood/seasonal_month/produce_available./base/localfood/produce_availability/seasonal_months(X2, X1)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /american_football/football_team/historical_roster./sports/sports_team_roster/position(X1, X0), /sports/sports_position/players./american_football/football_historical_roster_position/team(X2, X1)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /sports/sports_position/players./american_football/football_historical_roster_position/team(X0, X1), /sports/sports_position/players./american_football/football_historical_roster_position/team(X2, X1)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /sports/sports_position/players./sports/sports_team_roster/team(X0, X1), /sports/sports_position/players./american_football/football_historical_roster_position/team(X2, X1)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /sports/sports_position/players./american_football/football_historical_roster_position/team(X0, X1), /american_football/football_team/historical_roster./sports/sports_team_roster/position(X1, X2)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /sports/sports_position/players./american_football/football_historical_roster_position/team(X0, X1), /sports/sports_position/players./sports/sports_team_roster/team(X2, X1)
/sports/sports_position/players./american_football/football_historical_roster_position/position_s(X0, X2) :- /american_football/football_team/historical_roster./sports/sports_team_roster/position(X1, X0), /american_football/football_team/historical_roster./sports/sports_team_roster/position(X1, X2)
/education/educational_institution/campuses(X0, X1) :- /education/educational_institution/campuses(X1, X0)
/education/educational_institution/campuses(X0, X2) :- /education/educational_institution/campuses(X1, X0), /education/educational_institution/campuses(X2, X1)
/education/educational_institution/campuses(X0, X2) :- /education/educational_institution/campuses(X0, X1), /education/educational_institution/campuses(X2, X1)
/education/educational_institution/campuses(X0, X2) :- /education/educational_institution/campuses(X0, X1), /education/educational_institution/campuses(X1, X2)
/education/educational_institution/campuses(X0, X2) :- /education/educational_institution/campuses(X1, X0), /education/educational_institution/campuses(X1, X2)
/olympics/olympic_games/athletes./olympics/olympic_athlete_affiliation/sport(X0, X2) :- /olympics/olympic_games/athletes./olympics/olympic_athlete_affiliation/country(X0, X1), /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X2)
/olympics/olympic_games/athletes./olympics/olympic_athlete_affiliation/sport(X0, X2) :- /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X0, X1), /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X2)
/olympics/olympic_games/athletes./olympics/olympic_athlete_affiliation/sport(X0, X2) :- /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X0), /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X2)
/olympics/olympic_games/athletes./olympics/olympic_athlete_affiliation/sport(X0, X2) :- /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/olympics(X1, X0), /olympics/olympic_participating_country/athletes./olympics/olympic_athlete_affiliation/sport(X1, X2)
/olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/medal(X0, X2) :- /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X0, X1), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/medal(X1, X2)
/olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/medal(X0, X2) :- /olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/country(X0, X1), /olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/country(X2, X1)
/olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/medal(X0, X2) :- /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X0), /olympics/olympic_medal/medal_winners./olympics/olympic_medal_honor/country(X2, X1)
/olympics/olympic_games/medals_awarded./olympics/olympic_medal_honor/medal(X0, X2) :- /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/olympics(X1, X0), /olympics/olympic_participating_country/medals_won./olympics/olympic_medal_honor/medal(X1, X2)
/government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X2) :- /government/legislative_session/members./government/government_position_held/legislative_sessions(X1, X0), /government/legislative_session/members./government/government_position_held/legislative_sessions(X2, X1)
/government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X2) :- /government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X1), /government/legislative_session/members./government/government_position_held/legislative_sessions(X2, X1)
/government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X2) :- /government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X1), /government/legislative_session/members./government/government_position_held/legislative_sessions(X1, X2)
/government/legislative_session/members./government/government_position_held/legislative_sessions(X0, X2) :- /government/legislative_session/members./government/government_position_held/legislative_sessions(X1, X0), /government/legislative_session/members./government/government_position_held/legislative_sessions(X1, X2)