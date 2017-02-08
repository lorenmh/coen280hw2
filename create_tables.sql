-- Entity Definition
CREATE TABLE movie (
  -- 16 bit GUID
  id RAW(16) DEFAULT SYS_GUID(),
  title VARCHAR(128) NOT NULL,
  prod_cost NUMBER NOT NULL,
  release_date DATE,
  language VARCHAR(64) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE genre (
  title VARCHAR(64),
  PRIMARY KEY (id)
)

CREATE TABLE tv_show (
  -- 16 bit GUID
  id RAW(16) DEFAULT SYS_GUID(),
  network VARCHAR(64),
  name VARCHAR(128) NOT NULL,
  category VARCHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE location (
  id INTEGER,
  nation VARCHAR(128),
  state VARCHAR(128),
  town VARCHAR(128),
  PRIMARY KEY (id)
);

CREATE TABLE season (
  movie_id RAW(16) NOT NULL,
  num INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (movie_id, num),
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
);

CREATE TABLE awards_event(
  id INTEGER,
  name VARCHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE nomination (
  awards_event_id INTEGER,
  category VARCHAR(128),
  awards_date DATE,
  PRIMARY KEY (awards_event_id, category),
  FOREIGN KEY (awards_event_id) REFERENCES awards_event(id)
);

CREATE TABLE user_review (
  id INTEGER,
  text VARCHAR(4000),
  publish_date DATE,
  rating NUMBER,
  PRIMARY KEY (id)
);

CREATE TABLE critic_review (
  id INTEGER,
  text VARCHAR(4000),
  publish_date DATE,
  rating NUMBER,
  PRIMARY KEY (id)
);

CREATE TABLE imdb_user (
  id RAW(16) DEFAULT SYS_GUID(),
  fname VARCHAR(64),
  lname VARCHAR(64),
  dob DATE,
  email VARCHAR(128),
  gender VARCHAR(16)
  PRIMARY KEY (id)
);

CREATE TABLE celebrity (
  id RAW(16) DEFAULT SYS_GUID(),
  fname VARCHAR(64),
  lname VARCHAR(64),
  dob DATE,
  birth_location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (birth_location_id) REFERENCES location(id)
);
