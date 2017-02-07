CREATE TABLE movie (
  serial_no VARCHAR(64),
  title VARCHAR(128),
  prod_cost NUMBER,
  release_date DATE,
  language VARCHAR(64),
  PRIMARY KEY (serial_no)
);

CREATE TABLE genre (
  title VARCHAR(64),
  PRIMARY KEY (title)
)

CREATE TABLE tv_show (
  network VARCHAR(64),
  name VARCHAR(128),
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
  num INTEGER,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (num)
);
