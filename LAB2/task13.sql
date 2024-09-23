UPDATE countries
SET population = population*1.1
RETURNING country_name, population AS "New Population";