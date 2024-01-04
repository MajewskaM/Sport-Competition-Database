USE CompetitionsDataBase;

-- ON UPDATE CASCADE
SELECT *
FROM Disciplines

SELECT *
FROM enrolled_to
WHERE discipline_name_ref = '100m Hurdles'

UPDATE Disciplines SET discipline_name = '110m Hurdles' WHERE discipline_name = '100m Hurdles';

SELECT *
FROM Events
WHERE discipline_name_ref = '110m Hurdles'

SELECT *
FROM enrolled_to
WHERE discipline_name_ref = '110m Hurdles'

-- ON DELETE CASCADE
SELECT sp.scored_placeID, sp.general_place, sp.discipline_name_ref, sp.category_ref, rs.eventID
FROM has_scored AS hs
JOIN Scored_Places AS sp
ON hs.scored_placeID = sp.scored_placeID
JOIN Results AS rs
ON rs.scored_placeID = sp.scored_placeID
WHERE athlete_start_number = 11;

SELECT *
FROM Athletes
WHERE athlete_start_number = 11;

DELETE FROM Scored_Places WHERE scored_placeID = 31;

SELECT *
FROM has_scored
WHERE scored_placeID = 31;

SELECT *
FROM Results
WHERE scored_placeID = 31;

SELECT *
FROM Scored_Places
WHERE scored_placeID = 31;