USE CompetitionsDataBase;
GO
-- 1.1 Creating View of information about results of athletes, their scored places
-- on 'Health Sciences Sport Festival' competition
CREATE VIEW HealthSciencesResults AS
SELECT U.name, A.athlete_start_number, A.name AS athlete_name, A.surname AS athlete_surname,
    D.discipline_name, D.category, R.score, R.points
FROM Competitions C
JOIN Events E 
	ON C.competitionID = E.competitionID
JOIN Results R 
	ON E.eventID = R.eventID
JOIN scored_by sb 
	ON R.resultID = sb.resultID
JOIN Athletes A 
	ON sb.athlete_start_number = A.athlete_start_number
JOIN Registrations Rg 
	ON A.athlete_start_number = Rg.athlete_start_number
JOIN Universities U 
	ON Rg.universityID = U.universityID
JOIN Disciplines D 
	ON E.discipline_name_ref = D.discipline_name AND E.category_ref = D.category
JOIN Scored_Places SP 
	ON R.scored_placeID = SP.scored_placeID
WHERE C.name = 'Health Sciences Sport Festival';
