SET ECHO ON
SPOOL task2

-- Task 2.1

SELECT fname, lname
FROM Applicant JOIN Applies
ON Applicant.a# = Applies.a#
WHERE appdate < ANY
	(SELECT appdate
	FROM Applicant
	WHERE a# = 1);

-- Task 2.2
	
SELECT ptitle
FROM Position
WHERE salary >= ALL
	(SELECT salary FROM Position);

-- Task 2.3 - Doesn't make sense, employees whose applications are earlier than applications of applicant 7?
	
SELECT fname, lname
FROM Applicant JOIN Applies
ON Applicant.a# = Applies.a#
WHERE appdate < ALL  -- WHERE ALL appdate < ALL er rangt
	(SELECT appdate
	FROM Applicant
	WHERE a# = 7);

	
SPOOL OFF
