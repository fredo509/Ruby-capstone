CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  publisher VARCHAR(60) NOT NULL,
  cover_state VARCHAR(60) NOT NULL
)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(60) NOT NULL,
  color VARCHAR(60) NOT NULL
)

CREATE TABLE items_labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  label_id INT REFERENCES labels (id)
)

CREATE TABLE games(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  last_played_date DATE, 
  multiplayer BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
  PRIMARY KEY(id)
);

CREATE TABLE authors(
  id INT, 
  first_name VARCHAR(255), 
  last_name VARCHAR(255), 
  PRIMARY KEY(id)
);