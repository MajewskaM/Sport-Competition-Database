USE CompetitionsDataBase;

-- Showing the previously created view
SELECT *
FROM HealthSciencesResults;

-- 2. Using previously created view to sum points of single female athlete
-- scored on that competition
SELECT athlete_name, athlete_surname, SUM(points) AS TotalPoints
FROM HealthSciencesResults
WHERE category = 'women'
GROUP BY athlete_name, athlete_surname
ORDER BY TotalPoints DESC;
