# create a new db
CREATE DATABASE movie_db;

SHOW databases;

USE movie_db;

SHOW TABLES;

CREATE TABLE;

create table directors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    PRIMARY KEY (id)
);

describe directors_tbl;

# new entry
INSERT INTO directors_tbl VALUES(
    null,
    "James Cameron",
    1954
);

INSERT INTO directors_tbl VALUES(
    null,
    "Christopher Nolan",
    1970
);

CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int,
    director_id int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(director_id) REFERENCES directors_tbl(id)    
);

INSERT INTO movies_tbl VALUES(
    null,
    "Titanic",
    1997,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);


# Create main_actors_tbl table
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (ID)
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Arnold Schwarzenegger",
    1947,
    "m"
);

INSERT INTO main_actors_tbl VALUES(
    (null,
    "Gal Gadot",
    1985,
    "f"),
    (null,
    "Sigourney Weaver",
    1949,
    "f")
);


# Create your Movie-Actors table
CREATE TABLE movie_actors_tbl(
    movies_id int NOT NULL,
    main_actors_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actors_id),
    FOREIGN KEY (movie_id) REFERENCES movies_tbl(id),
    FOREIGN KEY (main_actors_id) REFERENCES main_actors_tbl(id)
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Zoe Saldaña%")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "%Dark Knight%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Christian Bale%")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "%Inception%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Angelina Jolie%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Aliens"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Sigourney Weaver%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Cleopatra"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gemma Chan%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Titanic"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "%Wonder Woman%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title Like "Terminator"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Arnold Schwarzenegger%")
);





SELECT * FROM movies_tbl JOIN directors_tbl ON movies_tbl.director_id =directors_tbl.id LIKE "Inception";

SELECT movies_tbl.title, directors_tbl.name
FROM movies_tbl JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id;


# TEST



```sql
WITH youngest_director
AS (SELECT id
    FROM directors_tbl 
    ORDER BY year_of_birth DESC
    Limit 1)
SELECT 
FROM youngest_director, all_movies title
    WHERE director_id = ; --(SELECT youngest_director)

AS (SELECT id, title, release_year, director_id
    FROM movies_tbl)
    ;
```


