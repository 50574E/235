-- Homework assignment
SET ECHO ON
SPOOL task1


-- Task 1.1

ALTER TABLE Department
	ADD CONSTRAINT Department_FK FOREIGN KEY(Manager#) REFERENCES Employee(e#);

-- Insert new department and manager.
INSERT INTO Department VALUES(6, 'Research Centre', '00271', TO_DATE('01/06/2016', 'DD/MM/YYYY'));
INSERT INTO DeptLocation VALUES(6, '3 Renovation Campus, North Wollongong, NSW 2500');
INSERT INTO Employee VALUES('00271', 'Garret', TO_DATE('10/04/1980', 'DD/MM/YYYY'), '13 Hindmarsh Ave, North Wollongong, NSW 2500', 'M', 125.2, '00100', 6);

-- Task 1.2 = done
ALTER TABLE WorksOn
	ADD CONSTRAINT Hours_check CHECK
		(Hours < 30)

-- Task 1.3 = done
ALTER TABLE Project
	MODIFY (PTitle VARCHAR2(50));

-- Task 1.4
ALTER TABLE Department
	ADD Total_staff_number NUMBER(3);

-- Untested
UPDATE Department
	SET Total_staff_number = count(unique Employee.E#)
	FROM Employee INNER JOIN Department
	WHERE Employee.D# = Department.D#;

-- Task 1.5



-- Task 1.6
ALTER TABLE Dependent
	MODIFY CONSTRAINT Dependent_CK CHECK (Relationship IN ('SON', 'DAUGHTER', 'SPOUSE', 'MOTHER', 'FATHER', 'OTHER');

-- Task 1.7


-- Task 1.8

SPOOL OFF
