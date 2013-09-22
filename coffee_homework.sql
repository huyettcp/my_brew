CREATE TABLE brewery (
  id serial primary key,
  brewery_name varchar(51) NOT NULL,
  city varchar(51) NOT NULL,
  state varchar(51) NOT NULL

);

CREATE TABLE beers (
  id serial primary key,
  beer_name varchar(51) NOT NULL,
  a_b_v varchar(3) NOT NULL,
  style varchar(10) NOT NULL,
  FOREIGN KEY(brewery_id)
    REFERENCES brewery(id)
);