-- Lab 2.05

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name LIKE '%Scarlett%';

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- ?

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
SELECT * FROM sakila.rental;

SELECT *, date_format(rental_date, '%M') AS 'Rental Month', date_format(rental_date, '%D') AS 'Rental Day', date_format(return_date, '%M') AS 'Return Month', date_format(return_date, '%D') AS 'Return Day'
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
