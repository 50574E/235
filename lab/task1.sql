SET ECHO ON
SPOOL task1

-- Task 1.1

SELECT a#, p#
FROM Applies
WHERE NOT EXISTS
	(SELECT *
	FROM Position
	WHERE Position.p# = Applies.p#);

-- Task 1.2

SELECT a#, p#
FROM Applies
WHERE NOT EXISTS
	(SELECT *
	FROM Applicant
	WHERE Applicant.a# = Applies.a#);

	
-- Task 1.3

SELECT MAX(salary) FROM Position;

-- With exists keyword: (does come close to being correct ... now :)

SELECT ptitle
FROM Position p1
WHERE NOT EXISTS
	(SELECT salary FROM Position p2 WHERE p1 = p2
	MINUS
	SELECT MAX(salary) FROM Position);

SPOOL OFF