CREATE TABLE person (
  id INTEGER,
  name VARCHAR(64),
  dob DATE,
  gender CHAR(1),
  birth_place VARCHAR(128),
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
  birth_place VARCHAR(64),
  email VARCHAR(128),
  gender VARCHAR(16),
  PRIMARY KEY (id)
);

CREATE TABLE imdb_user_review (
  movie_id INTEGER,
  imdb_user_id INTEGER NOT NULL,
  rating INTEGER,
  votes INTEGER,
  publish_date TIMESTAMP WITH TIME ZONE,
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


-- I had to use vim to format this, so forgive the sometimes misformattedness
INSERT INTO person VALUES (
  1, 'Brian de forma', TO_DATE('9/11/40', 'MM/DD/YY'), 'M', 'New York', 'Director'
);

INSERT INTO person VALUES (
  2, 'Martin Brest', TO_DATE('8/8/51', 'MM/DD/YY'), 'M', 'San Jose', 'Director'
);

INSERT INTO person VALUES (
  3, 'Scarlett Johanson', TO_DATE('11/22/84', 'MM/DD/YY'), 'F', 'Austin', 'Actor'
);

INSERT INTO person VALUES (
  4, 'Luc Besson', TO_DATE('5/30/75', 'MM/DD/YY'), 'F', 'Paris', 'Director'
);

INSERT INTO person VALUES (
  5, 'Morgan Freeman', TO_DATE('6/5/53', 'MM/DD/YY'), 'M', 'Canberra', 'Actor'
);

INSERT INTO person VALUES (
  6, 'Al Pacino', TO_DATE('11/12/56', 'MM/DD/YY'), 'M', 'Portland', 'Actor'
);

INSERT INTO person VALUES (
  7, 'Angelina Jolie', TO_DATE('3/3/70', 'MM/DD/YY'), 'F', 'Seattle', 'Actor'
);

INSERT INTO person VALUES (
  8, 'Brad Pitt', TO_DATE('4/4/75', 'MM/DD/YY'), 'M', 'London', 'Actor'
);

INSERT INTO person VALUES (
  9, 'Tom Hanks', TO_DATE('5/19/64', 'MM/DD/YY'), 'M', 'Perth', 'Actor'
);

INSERT INTO person VALUES (
  10, 'Jessica Alba', TO_DATE('8/7/83', 'MM/DD/YY'), 'F', 'Seoul', 'Actor'
);

INSERT INTO person VALUES (
  12, 'Alex Parish', TO_DATE('7/9/77', 'MM/DD/YY'), 'F', 'San Jose', 'Actor'
);

INSERT INTO person VALUES (
  13, 'Jack Nicholson', TO_DATE('11/13/58', 'MM/DD/YY'), 'M', 'Austin', 'Actor'
);

INSERT INTO person VALUES (
  15, 'Harrison Ford', TO_DATE('9/11/57', 'MM/DD/YY'), 'M', 'Canberra', 'Actor'
);

INSERT INTO person VALUES (
  16, 'Julia Roberts', TO_DATE('1/1/67', 'MM/DD/YY'), 'F', 'Portland', 'Actor'
);

INSERT INTO person VALUES (
  17, 'Matt Damon', TO_DATE('1/7/71', 'MM/DD/YY'), 'M', 'Seattle', 'Actor'
);

INSERT INTO person VALUES (
  18, 'Jennifer Lawrence', TO_DATE('2/2/62', 'MM/DD/YY'), 'F', 'London', 'Actor'
);

INSERT INTO person VALUES (
  19, 'George clooney', TO_DATE('3/3/65', 'MM/DD/YY'), 'M', 'Perth', 'Actor'
);

INSERT INTO person VALUES (
  20, 'Jennifer Aniston', TO_DATE('4/4/68', 'MM/DD/YY'), 'F', 'Seoul', 'Actor'
);


INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (
  1, 'john@yahoo.com', 'John ', 'Smith     ', TO_DATE('10/5/95', 'MM/DD/YY'), 'FL', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (2, 'juan@gmail.com', 'Juan ', 'Carlos      ', TO_DATE('4/12/94', 'MM/DD/YY'), 'AK', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (3, 'Jane@gmail.com', 'Jane ', 'Chapel      ', TO_DATE('11/2/93', 'MM/DD/YY'), 'IL', 'F'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (4, 'adi@yahoo.com', 'Aditya', 'Awasthi', TO_DATE('12/12/92', 'MM/DD/YY'), 'CA', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (5, 'james@hotmail.com', 'James ', 'Williams     ', TO_DATE('5/5/91', 'MM/DD/YY'), 'NY', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (6, 'mike@yahoo.com', 'Mike ', 'Brown      ', TO_DATE('3/1/88', 'MM/DD/YY'), 'NC', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (7, 'bob@yahoo.com', 'Bob ', 'Jones     ', TO_DATE('2/7/88', 'MM/DD/YY'), 'NY ', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (8, 'wei@gmail.com',  'Wei ', 'Zhang ', TO_DATE('8/12/85', 'MM/DD/YY'), 'NV', 'F'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (9, 'mark@gmail.com', 'Mark ', 'Davis   ', TO_DATE('5/10/84', 'MM/DD/YY'), 'CA', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (10, 'daniel@yahoo.com', 'Daniel  ', 'Garcia      ', TO_DATE('6/1/80', 'MM/DD/YY'), 'NJ', 'M'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (11, 'maria@hotmail.com', 'Maria', 'Rodriguez        ', TO_DATE('3/18/75', 'MM/DD/YY'), 'CA', 'F'
);

INSERT INTO imdb_user(id, email, fname, lname, dob, birth_place, gender) VALUES (12, 'freya@yahoo.com', 'Freya', 'Wilson     ', TO_DATE('2/19/70', 'MM/DD/YY'), 'NJ', 'F'
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  1, 'Scarface', TO_DATE('1988', 'YYYY'), 1
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  2, 'Scent of a women', TO_DATE('1995', 'YYYY'), 2
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  3, 'My big fat greek wedding', TO_DATE('2000', 'YYYY'), 4
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  4, 'The Devil''s Advocate', TO_DATE('1997', 'YYYY'), 1
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  5, 'Mr. and Mrs Smith', TO_DATE('1965', 'YYYY'), 1
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  6, 'Now You see me', TO_DATE('2013', 'YYYY'), 2
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  7, 'Barely Lethal', TO_DATE('2014', 'YYYY'), 4
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  8, 'The Man with one red shoe', TO_DATE('1984', 'YYYY'), 1
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  9, 'The Polar Express', TO_DATE('2010', 'YYYY'), 2
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  10, 'Her', TO_DATE('2013', 'YYYY'), 2
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  11, 'Lucy', TO_DATE('2015', 'YYYY'), 4
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  12, 'The Da Vinci Code', TO_DATE('2005', 'YYYY'), 4
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  13, 'The God Father part II', TO_DATE('1975', 'YYYY'), 1
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  15, 'Angels and Daemons', TO_DATE('2009', 'YYYY'), 2
);

INSERT INTO movie(id, title, release_date, director_person_id) VALUES (
  16, 'The Island', TO_DATE('2010', 'YYYY'), 4
);


INSERT INTO imdb_user_review VALUES(
  1, 1, 7, 25, TO_TIMESTAMP_TZ('Oct-02-07 09:10:54 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  2, 2, 8, 35, TO_TIMESTAMP_TZ('Sep-29-07 13:45:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  2, 3, 9, 24, TO_TIMESTAMP_TZ('Sep-29-07 10:38:25 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  3, 4, 10, 8, TO_TIMESTAMP_TZ('Oct-02-13 13:05:56 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  3, 5, 9, 11, TO_TIMESTAMP_TZ('Oct-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  4, 6, 8, 6, TO_TIMESTAMP_TZ('Sep-26-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  4, 7, 7, 23, TO_TIMESTAMP_TZ('Sep-26-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  5, 9, 9, 22, TO_TIMESTAMP_TZ('Sep-28-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  6, 10, 8, 26, TO_TIMESTAMP_TZ('Oct-29-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  7, 11, 8, 27, TO_TIMESTAMP_TZ('Sep-30-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  7, 12, 8, 18, TO_TIMESTAMP_TZ('Oct-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  8, 1, 7, 19, TO_TIMESTAMP_TZ('Sep-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  9, 2, 7, 16, TO_TIMESTAMP_TZ('Sep-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  10, 3, 8, 18, TO_TIMESTAMP_TZ('Sep-29-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  11, 4, 9, 22, TO_TIMESTAMP_TZ('Jun-07-15 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  11, 5, 10, 13, TO_TIMESTAMP_TZ('May-05-15 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  12, 6, 9, 50, TO_TIMESTAMP_TZ('May-05-15 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  13, 7, 5, 34, TO_TIMESTAMP_TZ('Oct-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  13, 1, 4, 34, TO_TIMESTAMP_TZ('Oct-25-07 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  15, 10, 8, 25, TO_TIMESTAMP_TZ('May-05-15 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);

INSERT INTO imdb_user_review VALUES(
  16, 11, 7, 12, TO_TIMESTAMP_TZ('May-05-15 17:15:00 PDT', 'Mon-DD-YY HH24:MI:SS TZD')
);


INSERT INTO movie_role VALUES (
  1, 5, 'Jessica'
);

INSERT INTO movie_role VALUES (
  1, 6, 'robert'
);

INSERT INTO movie_role VALUES (
  2, 5, 'John'
);

INSERT INTO movie_role VALUES (
  2, 6, 'Mark'
);

INSERT INTO movie_role VALUES (
  3, 9, 'Alex'
);

INSERT INTO movie_role VALUES (
  3, 7, 'Julie'
);

INSERT INTO movie_role VALUES (
  4, 5, 'Jessica'
);

INSERT INTO movie_role VALUES (
  4, 6, 'Matt'
);

INSERT INTO movie_role VALUES (
  4, 8, 'Jennifer'
);

INSERT INTO movie_role VALUES (
  5, 7, 'Jennifer'
);

INSERT INTO movie_role VALUES (
  5, 8, 'Tom'
);

INSERT INTO movie_role VALUES (
  5, 5, 'Milo'
);

INSERT INTO movie_role VALUES (
  6, 6, 'Chris'
);

INSERT INTO movie_role VALUES (
  6, 7, 'Rose'
);

INSERT INTO movie_role VALUES (
  6, 5, 'Bill'
);

INSERT INTO movie_role VALUES (
  7, 10, 'Jane'
);

INSERT INTO movie_role VALUES (
  7, 5, 'Brad'
);

INSERT INTO movie_role VALUES (
  8, 9, 'Lucas'
);

INSERT INTO movie_role VALUES (
  8, 10, 'Juanita'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Clayne'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Jane'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Brad'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Lucas'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Bradley'
);

INSERT INTO movie_role VALUES (
  9, 9, 'Justin'
);

INSERT INTO movie_role VALUES (
  9, 17, 'Martin'
);

INSERT INTO movie_role VALUES (
  9, 19, 'Mike'
);

INSERT INTO movie_role VALUES (
  10, 3, 'Travis'
);

INSERT INTO movie_role VALUES (
  10, 5, 'Alexander'
);

INSERT INTO movie_role VALUES (
  10, 6, 'Justin'
);

INSERT INTO movie_role VALUES (
  11, 3, 'Jessica'
);

INSERT INTO movie_role VALUES (
  11, 5, 'Johnny'
);

INSERT INTO movie_role VALUES (
  11, 8, 'Rami'
);

INSERT INTO movie_role VALUES (
  11, 9, 'Sam'
);

INSERT INTO movie_role VALUES (
  12, 9, 'Gatek'
);

INSERT INTO movie_role VALUES (
  12, 10, 'Rose'
);

INSERT INTO movie_role VALUES (
  12, 3, 'maria'
);

INSERT INTO movie_role VALUES (
  13, 5, 'Travis'
);

INSERT INTO movie_role VALUES (
  13, 6, 'Alexander'
);

INSERT INTO movie_role VALUES (
  13, 16, 'Pearl'
);

INSERT INTO movie_role VALUES (
  15, 12, 'Sofia'
);

INSERT INTO movie_role VALUES (
  15, 18, 'chrissy'
);

INSERT INTO movie_role VALUES (
  15, 9, 'Mike'
);

INSERT INTO movie_role VALUES (
  16, 10, 'Martin'
);

INSERT INTO movie_role VALUES (
  16, 15, 'Bill'
);

INSERT INTO movie_role VALUES (
  16, 16, 'Emilia'
);

