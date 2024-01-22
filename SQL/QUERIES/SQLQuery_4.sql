USE CompetitionsDataBase;

-- 4. Calculating total registrations from universities (that were 'used' during registration process)
-- not all universities participated
SELECT U.name, COUNT(R.registrationID) AS RegistrationCount
FROM Registrations R
LEFT JOIN Universities U
ON U.universityID = R.universityID
GROUP BY U.name
ORDER BY RegistrationCount DESC;