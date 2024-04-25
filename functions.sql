--create a function that returns the number of people given a first_name as parameter
CREATE OR REPLACE FUNCTION count_people_by_first_name(p_first_name TEXT)
    RETURNS INT
    LANGUAGE plpgsql
AS
$$
DECLARE
    total_people INT;
BEGIN
    SELECT COUNT(*)
    INTO total_people --store the value in the variable
    FROM people
    WHERE first_name ILIKE p_first_name;

    RETURN total_people;
END;
$$;

SELECT count_people_by_first_name('jesus');