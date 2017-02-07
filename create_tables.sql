-- Entity Definition
CREATE TABLE movie (
  -- 16 bit GUID
  id RAW(16) DEFAULT SYS_GUID(),
  title VARCHAR(128) NOT NULL,
  prod_cost NUMBER NOT NULL,
  release_date DATE,
  language VARCHAR(64) NOT NULL,
  PRIMARY KEY (serial_no)
);

CREATE TABLE genre (
  title VARCHAR(64),
  PRIMARY KEY (title)
)

CREATE TABLE tv_show (
  -- 16 bit GUID
  id RAW(16) DEFAULT SYS_GUID(),
  network VARCHAR(64),
  name VARCHAR(128) NOT NULL,
  category VARCHAR(64),
  PRIMARY KEY (network, name)
);

CREATE TABLE location (
  nation VARCHAR(128),
  state VARCHAR(128),
  town VARCHAR(128),
  PRIMARY KEY (nation, state, town)
);

CREATE TABLE season (
  movie_id RAW(16) NOT NULL,
  num INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (movie_id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE episode (
  movie_id RAW(16),
  season_num INTEGER,
  num INTEGER,
  title VARCHAR(128),
  length_minutes INTEGER,
  PRIMARY KEY (movie_id, season_num, num),
  FOREIGN KEY (movie_id, season_num) REFERENCES season(movie_id, num)
)
