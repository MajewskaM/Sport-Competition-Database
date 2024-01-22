USE CompetitionsDataBase;

-- 6. Showing Athletes results with a score above the average of all scored points
SELECT athlete_name, athlete_surname, score, points
FROM HealthSciencesResults
WHERE points > 
    (SELECT AVG(points)
     FROM Results);