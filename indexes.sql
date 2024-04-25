--USING people_data.sql script

--create an index for name column
CREATE INDEX people_first_name_idx ON people(first_name);

--drop the index
DROP INDEX people_first_name_idx;

--create a multi-column index
CREATE INDEX people_first_name_last_name_idx
ON people(first_name, last_name);

--create a unique index
CREATE UNIQUE INDEX people_first_name_unique_idx
ON people(first_name); -- this will fail because we have duplicates
--names in the table

--create a partial index (product table)
CREATE UNIQUE INDEX product_discontinued_partial_idx
ON product(discontinued)
WHERE discontinued IS TRUE;