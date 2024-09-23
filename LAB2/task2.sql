CREATE TABLE countries (
    country_id     SERIAL PRIMARY KEY,
    country_name   varchar,
    region_id      integer,
    population     integer
)