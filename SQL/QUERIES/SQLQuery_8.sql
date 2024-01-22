USE CompetitionsDataBase;

-- 8. Showing athletes who participated in events with at most 3 participants.
SELECT DISTINCT A.athlete_start_number, A.name AS athlete_name, A.surname AS athlete_surname
FROM Athletes A
JOIN participate_in p
ON A.athlete_start_number = p.athlete_start_number
WHERE p.eventID IN 
        (SELECT E.eventID
        FROM participate_in p
        JOIN Events E 
		ON p.eventID = E.eventID
        GROUP BY E.eventID
        HAVING COUNT(DISTINCT p.athlete_start_number) <= 3);