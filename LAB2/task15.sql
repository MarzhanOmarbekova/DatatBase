DELETE FROM countries_new AS copy
USING countries
WHERE copy.country_id = countries.country_id
RETURNING *;