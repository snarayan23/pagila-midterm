/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */


SELECT country.country 
FROM customer 
JOIN address using (address_id) 
JOIN city using (city_id) 
JOIN country using (country_id) 
GROUP BY country.country 
ORDER BY count(customer.customer_id) DESC
LIMIT 1; 
