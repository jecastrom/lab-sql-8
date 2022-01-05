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
-- 3. How many films are there for each of the categories in the category table?
-- 4. Which actor has appeared in the most films?
-- 5. Most active customer
-- 6. Find which is the most rented film