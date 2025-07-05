-- write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
--Your query should output a table with a single column for the name of each person.
SELECT name
FROM people JOIN directors ON directors.person_id = people.id JOIN ratings ON ratings.movie_id = directors.movie_id
WHERE rating >= 9.0
GROUP BY name, person_id;
