USE CompetitionsDataBase;

-- 3. Query using INNER JOIN, showing all Universities that participated in Competition of ID = 3
SELECT DISTINCT(U.name)
FROM Universities U
INNER JOIN Registrations R
ON U.universityID = R.universityID
WHERE R.competitionID = 3;