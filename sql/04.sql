/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

--I decided to exclude the movie 'American Circus' 

SELECT DISTINCT F.title 
from film as F 
JOIN film_actor as FA1 on (F.film_id = FA1.film_id)
JOIN film_actor as FA2 on (FA1.film_id = FA2.film_id)
WHERE FA1.actor_id in (
    SELECT actor.actor_id 
    FROM actor 
    JOIN film_actor using (actor_id) 
    JOIN film using (film_id) 
    WHERE film.title = 'AMERICAN CIRCUS')
and FA2.actor_id in (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor using (actor_id)
    JOIN film using (film_id)
    WHERE film.title = 'AMERICAN CIRCUS')
AND FA1.actor_id != FA2.actor_id
AND F.title != 'AMERICAN CIRCUS'
ORDER BY F.title; 
