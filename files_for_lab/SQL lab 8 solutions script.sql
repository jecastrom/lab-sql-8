-- SQL Lab 8
-- 1. Rank films by length
SELECT
    title,
    `length`,
    dense_rank() over(
        ORDER BY
            `length` DESC
    ) AS ranking
FROM
    film
WHERE
    `length` NOT IN (0, '', ' ');
-- 2. Rank films by length within the rating category
SELECT
    title,
    `length`,
    rating,
    dense_rank() over(
        ORDER BY
            `length` DESC
    ) AS ranking
FROM
    film
WHERE
    `length` NOT IN (0, '', ' ')
ORDER BY
    3;
-- 3. How many films are there for each of the categories in the category table?
SELECT
    a.`name` AS film_category,
    count(b.film_id) AS number_of_films
FROM
    category a
    INNER JOIN film_category b ON a.category_id = b.category_id
GROUP BY
    1
ORDER BY
    2 DESC;
-- 4. Which actor has appeared in the most films?
SELECT
    concat((a.first_name), ' ', (a.last_name)) actor_name,
    count(b.film_id) AS actors_appearances
FROM
    actor a
    INNER JOIN film_actor b ON a.actor_id = b.actor_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1;
-- 5. Most active customer
SELECT
    concat((a.first_name), ' ', (a.last_name)) customer_name,
    count(b.rental_id) AS rented_films
FROM
    customer a
    INNER JOIN rental b ON a.customer_id = b.customer_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1;
-- 6. Find which is the most rented film