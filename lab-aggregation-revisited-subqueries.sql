use sakila;

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

SELECT 
    p.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    AVG(p.amount) AS average_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id, customer_name;

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action';

SELECT DISTINCT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT r.customer_id
    FROM rental r
    WHERE r.inventory_id IN (
        SELECT DISTINCT i.inventory_id
        FROM inventory i
        WHERE i.film_id IN (
            SELECT DISTINCT f.film_id
            FROM film f
            JOIN film_category fc ON f.film_id = fc.film_id
            JOIN category c ON fc.category_id = c.category_id
            WHERE c.name = 'Action'
        )
    )
);


SELECT 
    customer_id,    
    amount,
    CASE
        WHEN amount BETWEEN 0 AND 2 THEN 'Low'
        WHEN amount BETWEEN 2 AND 4 THEN 'Medium'
        ELSE 'High'
    END AS payment_classification
FROM payment;

select * from payment;
