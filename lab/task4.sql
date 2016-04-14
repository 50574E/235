SET ECHO ON
SPOOL task3

-- Task 4.1 - Same as creating table (stolen from satvik but same so w/e)

CREATE VIEW VAPPS(p#, totap) AS
SELECT Position.p#, count(a#)
FROM Position LEFT OUTER JOIN Applies
ON Position.p# = Applies.p#
GROUP BY Position.p#

-- Task 4.2   IN the parenthesis is a set of all applicants who have two or more applications.

GRANT SELECT ON () TO SCOTT

-- Task 4.3

GRANT REFERENCES (a#, p#) ON Applies TO SCOTT
	
-- NOTE {(a#, p#) ON Applies} is the stuff you're granting access to.
	
SPOOL OFF