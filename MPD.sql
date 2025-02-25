BEGIN;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS challenge CASCADE;
DROP TABLE IF EXISTS proposition CASCADE;
DROP TABLE IF EXISTS vote_challenge CASCADE;
DROP TABLE IF EXISTS vote_proposition CASCADE;
COMMIT;

BEGIN;
CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    date INTEGER NOT NULL,
    platform TEXT NOT NULL,
    picture TEXT NOT NULL
);

CREATE TABLE player (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE challenge (
    id INTEGER PRIMARY KEY,
    player_id INTEGER REFERENCES player(id) ON DELETE CASCADE,
    game_id INTEGER REFERENCES game(id) ON DELETE CASCADE,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE proposition (
    id INTEGER PRIMARY KEY,
    challenge_id INTEGER REFERENCES challenge(id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES player(id) ON DELETE CASCADE,
    title TEXT NOT NULL UNIQUE,
    description TEXT,
    url_video TEXT NOT NULL
    );

CREATE TABLE vote_challenge (
    challenge_id INTEGER REFERENCES challenge(id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES player(id) ON DELETE CASCADE
);

CREATE TABLE vote_proposition (
    player_id INTEGER REFERENCES player(id) ON DELETE CASCADE,
    proposition_id INTEGER REFERENCES proposition(id) ON DELETE CASCADE
);
COMMIT;