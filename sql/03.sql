/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

SELECT DISTINCT first_name, last_name 
FROM actor
WHERE actor.actor_id in (
    SELECT actor.actor_id 
    FROM actor 
    JOIN film_actor using (actor_id) 
    JOIN film using (film_id) 
    JOIN film_category using (film_id) 
    JOIN category using (category_id) 
    WHERE category.category_id =3)
AND actor.actor_id NOT in (
        SELECT actor.actor_id
    FROM actor
    JOIN film_actor using (actor_id)
    JOIN film using (film_id)
    JOIN film_category using (film_id)
    JOIN category using (category_id)
    WHERE category.category_id = 11)
ORDER BY first_name, last_name; 
