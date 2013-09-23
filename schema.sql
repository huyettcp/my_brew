CREATE TABLE breweries (
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
  brewery_id serial,
  FOREIGN KEY(brewery_id)
    REFERENCES breweries(id) ON DELETE CASCADE
);
