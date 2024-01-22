USE CompetitionsDataBase;

-- 7. Calculating the average and total number of points scored in a single competition.
-- Showing only results with number of points greater than 20.
SELECT C.name AS Competition, AVG(points) AS AvgPoints, SUM(points) AS TotalPoints
FROM Results R
JOIN Events E 
ON R.eventID = E.eventID
JOIN Competitions C 
ON E.competitionID = C.competitionID
GROUP BY C.name
HAVING SUM(points) >= 20
ORDER BY TotalPoints DESC;