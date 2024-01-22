USE CompetitionsDataBase;

-- 5. Using subquery, showing registrations to competitions send after date: '2023-01-01'
SELECT *
FROM Registrations
WHERE competitionID IN 
	(SELECT competitionID 
	 FROM Competitions 
	 WHERE start_date > '2023-01-01');