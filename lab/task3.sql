SET ECHO ON
SPOOL task3

-- Task 3.1

CREATE TABLE TOTAPPS(anum,totap) AS
SELECT Applicant.a#, COUNT(p#)
FROM Applicant LEFT OUTER JOIN Applies
ON Applicant.a# = Applies.a#
GROUP BY Applicant.a#;

-- Task 3.2 : Experiment first

UPDATE Position
SET salary = salary * 1.1
WHERE
  (SELECT salary
  FROM Position JOIN Applies
  ON Position.p# = Applies.p#
  WHERE NOT EXISTS
    (SELECT a#
    FROM Applies));

-- Working Version

update position
set salary = salary * 1.1
where exists (select position.p#
  from position join applies
  on position.p# = applies.p#
  where not exists
  (select unique p# from applies)

-- Task 3.3 : First was an experiment.

DELETE FROM Applicant JOIN Applies
ON Applicant.a# = Applies.a#
WHERE NOT EXISTS
  (SELECT p# FROM Applies)

-- Working Version

DELETE FROM Applicant
WHERE Applicant.a# not in
  (SELECT unique applies.a# FROM Applies);
	
SPOOL OFF
