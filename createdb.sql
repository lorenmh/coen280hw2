CREATE TABLE person (
  id INTEGER,
  name VARCHAR(64),
  dob DATE,
  gender CHAR(1),
  birthplace VARCHAR(128),
  attribute VARCHAR(128),
  PRIMARY KEY (id)
);

-- Entity Definition
CREATE TABLE movie (
  id INTEGER,
  title VARCHAR(128) NOT NULL,
  release_date DATE,
  director_person_id INTEGER,
  producer_person_id INTEGER,
  prod_cost NUMBER,
  location VARCHAR(128),
  PRIMARY KEY (id),
  FOREIGN KEY (director_person_id) REFERENCES person(id),
  FOREIGN KEY (producer_person_id) REFERENCES person(id)
);

CREATE TABLE language (
  id INTEGER,
  title VARCHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE genre (
  id INTEGER,
  title VARCHAR(64),
  PRIMARY KEY (id)
);

create table movie_genre (
  movie_id integer,
  genre_id integer,
  foreign key (movie_id) references movie(id),
  foreign key (genre_id) references genre(id)
);

create table movie_language (
  movie_id integer,
  language_id integer,
  foreign key (movie_id) references movie(id),
  foreign key (language_id) references language(id)
);

CREATE TABLE tv_show (
  id INTEGER,
  network VARCHAR(64),
  name VARCHAR(128) NOT NULL,
  category VARCHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE scene (
  movie_id INTEGER,
  num INTEGER NOT NULL,
  location VARCHAR(128),
  PRIMARY KEY (movie_id, num),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
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
  name VARCHAR(128),
  PRIMARY KEY (id)
);

CREATE TABLE award (
  id INTEGER,
  awards_event_id INTEGER NOT NULL,
  category VARCHAR(128) NOT NULL,
  awards_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (awards_event_id) REFERENCES awards_event(id)
);

CREATE TABLE movie_nomination (
  movie_id INTEGER,
  award_id INTEGER,
  is_winner NUMBER(1),
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (award_id) REFERENCES award(id)
);

CREATE TABLE tv_show_nomination (
  tv_show_id INTEGER,
  award_id INTEGER,
  is_winner NUMBER(1),
  FOREIGN KEY (tv_show_id) REFERENCES tv_show(id),
  FOREIGN KEY (award_id) REFERENCES award(id)
);

CREATE TABLE person_nomination (
  person_id INTEGER,
  award_id INTEGER,
  is_winner NUMBER(1),
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (award_id) REFERENCES award(id)
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

CREATE TABLE imdb_user_review (
  movie_id INTEGER,
  imdb_user_id INTEGER NOT NULL,
  rating INTEGER,
  votes INTEGER,
  publish_date DATE,
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (imdb_user_id) REFERENCES imdb_user(id)
);

CREATE TABLE critic_review (
  person_id INTEGER NOT NULL,
  movie_id INTEGER,
  text VARCHAR(4000),
  publish_date DATE,
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie_role (
  movie_id INTEGER,
  person_id INTEGER,
  role VARCHAR(128),
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE tv_show_role (
  tv_show_id INTEGER,
  season_num INTEGER,
  episode_num INTEGER,
  person_id INTEGER,
  role VARCHAR(128),
  FOREIGN KEY (tv_show_id, season_num, episode_num)
      REFERENCES episode(tv_show_id, season_num, num),
  FOREIGN KEY (person_id) REFERENCES person(id)
);

INSERT INTO person VALUES (
  1, 'Brian de forma', TO_DATE('9/11/40', 'MM/DD/YY'), 'M', 'New York', 'Director'
);

INSERT INTO person VALUES (
  2, 'Martin Brest', TO_DATE('8/8/51', 'MM/DD/YY'), 'M', 'San Jose, Director'
);

INSERT INTO person VALUES (
  3, 'Scarlett Johanson', TO_DATE('11/22/84', 'MM/DD/YY'), 'F', 'Austin, Actor'
);

INSERT INTO person VALUES (
  4, 'Luc Besson', TO_DATE('5/30/75', 'MM/DD/YY'), 'F', 'Paris, Director'
);

INSERT INTO person VALUES (
  5, 'Morgan Freeman', TO_DATE('6/5/53', 'MM/DD/YY'), 'M', 'Canberra, Actor'
);

INSERT INTO person VALUES (
  6, 'Al Pacino', TO_DATE('11/12/56', 'MM/DD/YY'), 'M', 'Portland, Actor'
);

INSERT INTO person VALUES (
  7, 'Angelina Jolie', TO_DATE('3/3/70', 'MM/DD/YY'), 'F', 'Seattle, Actor'
);

INSERT INTO person VALUES (
  8, 'Brad Pitt', TO_DATE('4/4/75', 'MM/DD/YY'), 'M', 'London, Actor'
);

INSERT INTO person VALUES (
  9, 'Tom Hanks', TO_DATE('5/19/64', 'MM/DD/YY'), 'M', 'Perth, Actor'
);

INSERT INTO person VALUES (
  10, 'Jessica Alba', TO_DATE('8/7/83', 'MM/DD/YY'), 'F', 'Seoul, Actor'
);

INSERT INTO person VALUES (
  12, 'Alex Parish', TO_DATE('7/9/77', 'MM/DD/YY'), 'F', 'San Jose, Actor'
);

INSERT INTO person VALUES (
  13, 'Jack Nicholson', TO_DATE('11/13/58', 'MM/DD/YY'), 'M', 'Austin, Actor'
);

INSERT INTO person VALUES (
  15, 'Harrison Ford', TO_DATE('9/11/57', 'MM/DD/YY'), 'M', 'Canberra, Actor'
);

INSERT INTO person VALUES (
  16, 'Julia Roberts', TO_DATE('1/1/67', 'MM/DD/YY'), 'F', 'Portland, Actor'
);

INSERT INTO person VALUES (
  17, 'Matt Damon', TO_DATE('1/7/71', 'MM/DD/YY'), 'M', 'Seattle, Actor'
);

INSERT INTO person VALUES (
  18, 'Jennifer Lawrence', TO_DATE('2/2/62', 'MM/DD/YY'), 'F', 'London, Actor'
);

INSERT INTO person VALUES (
  19, 'George clooney', TO_DATE('3/3/65', 'MM/DD/YY'), 'M', 'Perth, Actor'
);

INSERT INTO person VALUES (
  20, 'Jennifer Aniston', TO_DATE('4/4/68', 'MM/DD/YY'), 'F', 'Seoul, Actor'
);

