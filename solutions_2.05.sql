-- Lab 2.05

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name LIKE '%Scarlett%';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT inventory_id) AS 'available for rent', COUNT(*) AS 'have been rented'
FROM sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) AS 'min_duration', MAX(length) AS 'max_duration'
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(1, 'h', ' ', AVG(length)-60) AS 'average movie duration' FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT MAX(DATEDIFF(last_update, rental_date)) FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') AS 'Rental Month', DAYNAME(rental_date) AS 'Rental Day', date_format(return_date, '%M') AS 'Return Month', DAYNAME(return_date) AS 'Return Day'
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN WEEKDAY(rental_date) IN (0, 1, 2, 3, 4) then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental;

-- 9. Get release years
SELECT DISTINCT release_year FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT title FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT length, title FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(special_features) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
