CREATE TABLE location (
  id INTEGER,
  nation VARCHAR(128),
  state VARCHAR(128),
  town VARCHAR(128),
  PRIMARY KEY (id)
);

CREATE TABLE celebrity (
  id INTEGER,
  fname VARCHAR(64),
  lname VARCHAR(64),
  dob DATE,
  birth_location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (birth_location_id) REFERENCES location(id)
);

-- Entity Definition
CREATE TABLE movie (
  id INTEGER,
  title VARCHAR(128) NOT NULL,
  prod_cost NUMBER NOT NULL,
  release_date DATE,
  director_celebrity_id INTEGER,
  producer_celebrity_id INTEGER,
  location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (director_celebrity_id, producer_celebrity_id)
      REFERENCES celebrity(id),
  FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE language (
  title VARCHAR(64),
  PRIMARY KEY (title)
)

CREATE TABLE genre (
  title VARCHAR(64),
  PRIMARY KEY (title)
)

CREATE TABLE tv_show (
  id INTEGER,
  network VARCHAR(64),
  name VARCHAR(128) NOT NULL,
  category VARCHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE season (
  tv_show_id INTEGER,
  num INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (tv_show_id, num),
  FOREIGN KEY (tv_show_id) REFERENCES tv_show(id)
);

CREATE TABLE episode (
  tv_show_id INTEGER,
  season_num INTEGER,
  num INTEGER,
  title VARCHAR(128),
  length_minutes INTEGER,
  PRIMARY KEY (tv_show_id, season_num, num),
  FOREIGN KEY (tv_show_id, season_num) REFERENCES season(tv_show_id, num)
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

CREATE TABLE imdb_user_review (
  id INTEGER,
  imdb_user_id INTEGER,
  text VARCHAR(4000),
  publish_date DATE,
  rating NUMBER,
  PRIMARY KEY (id),
  FOREIGN KEY (imdb_user_id) REFERENCES imdb_user(id)
);

CREATE TABLE critic_review (
  id INTEGER,
  celebrity_id INTEGER,
  text VARCHAR(4000),
  publish_date DATE,
  rating NUMBER,
  PRIMARY KEY (id),
  FOREIGN KEY (celebrity_id) REFERENCES celebrity(id)
);

CREATE TABLE imdb_user (
  id INTEGER,
  fname VARCHAR(64),
  lname VARCHAR(64),
  dob DATE,
  email VARCHAR(128),
  gender VARCHAR(16),
  PRIMARY KEY (id)
);

CREATE TABLE movie_actor (
  movie_id INTEGER,
  celebrity_id INTEGER,
  PRIMARY KEY (movie_id, celebrity_id),
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (celebrity_id) REFERENCES celebrity(id)
);

CREATE TABLE tv_show_actor (
  tv_show_id INTEGER,
  season_num INTEGER,
  episode_num INTEGER,
  celebrity_id INTEGER,
  PRIMARY KEY (tv_show_id, season_num, episode_num, celebrity_id),
  FOREIGN KEY (tv_show_id, season_num, episode_num)
      REFERENCES episode(tv_show_id, season_num, num),
  FOREIGN KEY (celebrity_id) REFERENCES celebrity(id)
);
