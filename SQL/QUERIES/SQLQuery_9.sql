USE CompetitionsDataBase;
-- 9. Summing up all points scored by universities of one type in one competition
-- Showing average of scored points of those university types during all competitions
SELECT university_type, AVG(TotalScore) AS AverageScore
FROM (
    SELECT U.university_type, C.name AS competition_name, SUM(Res.points) AS TotalScore
    FROM Universities U
    JOIN Registrations R ON U.universityID = R.universityID
    JOIN Events E ON R.competitionID = E.competitionID
    JOIN Results Res ON E.eventID = Res.eventID
    JOIN Competitions C ON R.competitionID = C.competitionID
    GROUP BY
        U.university_type, C.name
) AS CompetitionScores
GROUP BY university_type
ORDER BY AverageScore DESC;
