
1. List all the actors born before 1980.
```sql
select name actor_name, year_of_birth 
FROM main_actors_tbl where year_of_birth < 1980;
+-----------------------+---------------+
| actor_name            | year_of_birth |
+-----------------------+---------------+
| Arnold Schwarzenegger |          1947 |
| Sigourney Weaver      |          1949 |
| Christian Bale        |          1974 |
| Leonardo DiCaprio     |          1974 |
| Angelina Jolie        |          1975 |
| Zoe Saldaña           |          1978 |
+-----------------------+---------------+
```

2. How many movies did Nolan direct ?
```sql 
select dir.name director_name, mov.title movie_name  
FROM directors_tbl dir 
INNER JOIN movies_tbl mov ON dir.id = mov.director_id  
WHERE dir.name LIKE "%Nolan%";

+-------------------+-----------------+
| director_name     | movie_name      |
+-------------------+-----------------+
| Christopher Nolan | Inception       |
| Christopher Nolan | The Dark Knight |
+-------------------+-----------------+
```


3. Among all the movies of James Cameron, how many were female actors ?
```sql 
select 
dir.name director_name, 
mov.title movie_name, 
act.name female_actor  
FROM movie_actors_tbl mov_act
INNER JOIN movies_tbl mov ON mov.id = mov_act.movie_id  
INNER JOIN main_actors_tbl act ON act.id = mov_act.main_actors_id
INNER JOIN directors_tbl dir ON dir.id = mov.director_id
WHERE dir.name LIKE "%Cameron%" 
AND act.sex LIKE "f";
```

+---------------+------------+------------------+
| director_name | movie_name | female_actor     |
+---------------+------------+------------------+
| James Cameron | Aliens     | Sigourney Weaver |
| James Cameron | Avatar     | Zoe Saldaña      |
+---------------+------------+------------------+


OR 


```sql
select 
dir.name director_name, 
COUNT(act.name) amount_female_actresses
FROM movie_actors_tbl mov_act
INNER JOIN movies_tbl mov ON mov.id = mov_act.movie_id  
INNER JOIN main_actors_tbl act ON act.id = mov_act.main_actors_id
INNER JOIN directors_tbl dir ON dir.id = mov.director_id
WHERE dir.name LIKE "%Cameron%" 
AND act.sex LIKE "f"
GROUP BY 1;
```

+---------------+-------------------------+
| director_name | amount_female_actresses |
+---------------+-------------------------+
| James Cameron |                       2 |
+---------------+-------------------------+



4. How many directors did Leonardo DiCaprio worked with ?
```sql 
select 
act.name actor_name,
COUNT(dir.name) amount_directors
FROM movie_actors_tbl mov_act
INNER JOIN movies_tbl mov ON mov.id = mov_act.movie_id  
INNER JOIN main_actors_tbl act ON act.id = mov_act.main_actors_id
INNER JOIN directors_tbl dir ON dir.id = mov.director_id
WHERE act.name LIKE "%Caprio%" 
GROUP BY 1;
```
+-------------------+------------------+
| actor_name        | amount_directors |
+-------------------+------------------+
| Leonardo DiCaprio |                2 |
+-------------------+------------------+


5. Who is the oldest director ?
```sql
SELECT name, year_of_birth
FROM directors_tbl 
ORDER BY year_of_birth
Limit 1;
```
+---------------+---------------+
| name          | year_of_birth |
+---------------+---------------+
| James Cameron |          1954 |
+---------------+---------------+


6. What is the earliest movie of the youngest director ?
```sql
SELECT mov.title movie_title, mov.release_year, dir.name director_name, dir.year_of_birth 
FROM movies_tbl mov 
INNER JOIN directors_tbl dir ON mov.director_id = dir.id
WHERE dir.id = (SELECT id
    FROM directors_tbl 
    ORDER BY year_of_birth DESC
    Limit 1 );
```

+-------------+--------------+---------------+---------------+
| movie_title | release_year | director_name | year_of_birth |
+-------------+--------------+---------------+---------------+
| Eternals    |         2021 | Chloe Zhaos   |          1982 |
+-------------+--------------+---------------+---------------+


7. What is the latest movie of the youngest actor ?
```sql
SELECT mov.title movie_title, mov.release_year, act.name actors_name, act.year_of_birth 
FROM movie_actors_tbl mov_act
INNER JOIN movies_tbl mov ON mov.id = mov_act.movie_id  
INNER JOIN main_actors_tbl act ON act.id = mov_act.main_actors_id
INNER JOIN directors_tbl dir ON dir.id = mov.director_id
WHERE act.id = (SELECT id
    FROM main_actors_tbl 
    ORDER BY year_of_birth DESC
    Limit 1 )
AND mov.id = (SELECT id
    FROM movies_tbl 
    ORDER BY release_year DESC
    Limit 1 );
```
+-------------+--------------+-------------+---------------+
| movie_title | release_year | actors_name | year_of_birth |
+-------------+--------------+-------------+---------------+
| Cleopatra   |         2023 | Gal Gadot   |          1985 |
+-------------+--------------+-------------+---------------+
