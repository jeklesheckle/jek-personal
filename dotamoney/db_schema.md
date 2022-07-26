
Table: Players
    primary key: player id / friend id (int)
    nickname (string)
    date registered (date)
    discord ID (string)
    region (string)

Table: Teams
    primary key: team id (int)
    team name (string)
    players (array)

Table: Matches
    primary key: match id (int)
    team1 (foreign key)
    team2 (foreign key)