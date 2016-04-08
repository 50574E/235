/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Subject:            CSCI235 Databases
    Script name:        clist.sql
    Written by:         Dr Janusz R. Getta
    Task:               List all constraints
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SET FEEDBACK OFF
SET LINESIZE 100
SET PAGESIZE 200
TTITLE "USER CONSTRAINTS"
BREAK ON TABLE_NAME
COLUMN table_name FORMAT A20 HEADING "TABLE NAME"
COLUMN constraint_name FORMAT A30 HEADING "CONSTRAINT NAME"
COLUMN type FORMAT A15 HEADING "CONSTRAINT TYPE"
COLUMN search_condition FORMAT A30 HEADING "CONDITION"
select  table_name,
        constraint_name, 
        decode(constraint_type, 'P', 'PRIMARY KEY',
				'U', 'CANDIDATE KEY',
                                'R', 'FOREIGN KEY',
                                'C', 'DOMAIN',
                                'V', 'CHECK/VIEW',
                                'R', 'READ/VIEW'    )  type, 
        search_condition 
from user_constraints
ORDER BY table_name, constraint_name;
TTITLE "REFERENTIAL INTEGRITY CONSTRAINTS"
BREAK ON CONSTRAINT_NAME
COLUMN TABLE_NAME FORMAT A20 HEADING "TABLE"
COLUMN COLUMN_NAME FORMAT A10 HEADING "COLUMN"
COLUMN CONSTRAINT_NAME FORMAT A25 HEADING "CONSTRAINT"
COLUMN R_CONSTRAINT_NAME FORMAT A20 HEADING "REFERENCED CONSTRAINT"
COLUMN REFERENCES FORMAT A10 HEADING "          "
SELECT USER_CONSTRAINTS.CONSTRAINT_NAME CONSTRAINT_NAME,
       UCC1.TABLE_NAME TABLE_NAME, 
       UCC1.COLUMN_NAME COLUMN_NAME,
       '--------->' REFERENCES,
       UCC2.TABLE_NAME TABLE_NAME,
       UCC2.COLUMN_NAME COLUMN_NAME
FROM   USER_CONSTRAINTS, 
       USER_CONS_COLUMNS UCC1,
       USER_CONS_COLUMNS UCC2
WHERE  USER_CONSTRAINTS.CONSTRAINT_NAME = UCC1.CONSTRAINT_NAME AND
       USER_CONSTRAINTS.R_CONSTRAINT_NAME = UCC2.CONSTRAINT_NAME AND
       UCC1.POSITION = UCC2.POSITION AND
       CONSTRAINT_TYPE = 'R'
ORDER BY USER_CONSTRAINTS.CONSTRAINT_NAME;
PROMPT
TTITLE OFF
SET FEEDBACK ON

PROMPT Done.
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
