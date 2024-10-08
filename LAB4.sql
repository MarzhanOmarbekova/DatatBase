--1
CREATE DATABASE lab4;

--2
CREATE TABLE warehouses(
    code INTEGER,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE boxes(
    code CHAR(4),
    contents VARCHAR(255),
    value real,
    warehouse INTEGER
);

--3
INSERT INTO warehouses
VALUES
        (1, 'Chicago', 3),
        (2, 'Chicago', 4),
        (3, 'New York', 7),
        (4, 'Los Angeles', 2),
        (5, 'San Francisco', 8);

INSERT INTO boxes
VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

--4
SELECT * FROM warehouses;

--5
SELECT * FROM boxes
WHERE value > 150;

--6
SELECT DISTINCT * FROM boxes;

--7
SELECT warehouse , count(*) FROM boxes
GROUP BY warehouse;

--8
SELECT warehouse , count(*) FROM boxes
GROUP BY warehouse
HAVING count(*)>2;

--9
INSERT INTO warehouses
VALUES (3,'New York', 3);

--10
INSERT INTO boxes
VALUES ('H5RT', 'Papers', 200, 2);

--11
UPDATE boxes
SET value = value*0.85
WHERE value = (SELECT DISTINCT ON(value) value FROM boxes ORDER BY value DESC NULLS LAST LIMIT 1 OFFSET 2)
RETURNING *;


--12
DELETE FROM boxes WHERE value<150;

--13
DELETE FROM boxes USING warehouses
WHERE warehouse = warehouses.code AND location = 'New York'
RETURNING *;

-- SELECT * FROM boxes;
-- SELECT * FROM warehouses;