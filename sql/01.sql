/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

WITH C1 as (SELECT DISTINCT title, film_id
from film 
WHERE film.title NOT LIKE '%F%'),

C2 as (SELECT DISTINCT film.title, film.film_id 
FROM film 
JOIN film_actor using (film_id)
JOIN actor using (actor_id)
WHERE actor.first_name LIKE '%F%'
OR actor.last_name LIKE '%F%'),

C3 as (SELECT DISTINCT film.title, film.film_id 
FROM film
JOIN inventory using (film_id) 
JOIN rental using (inventory_id)
JOIN customer using (customer_id) 
WHERE customer.first_name LIKE '%F%'
OR customer.last_name LIKE '%F%'),

C4 as (SELECT DISTINCT film.title, film.film_id 
FROM film 
JOIN inventory using (film_id) 
JOIN rental using (inventory_id)
JOIN customer using (customer_id) 
JOIN address using (address_id) 
JOIN city using (city_id) 
JOIn country using (country_id)
where address.address LIKE '%F%'
or address.address2 LIKE '%F%'
or city.city LIKE '%F%'
or country.country LIKE '%F%')

SELECT DISTINCT title from C1 
EXCEPT (SELECT title from C2)
EXCEPT (SELECT title from C3) 
EXCEPT (SELECT title from C4)
ORDER BY title; 
