/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Subject:            CSCI235 Databases
    Script name:        tlist.sql
    Written by:         Dr Janusz R. Getta
    Task:               To list full description of a relational table
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SET FEEDBACK OFF
SET VERIFY OFF
SET LINESIZE 100
SET PAGESIZE 100
ACCEPT TNAME CHAR PROMPT 'TABLE>'
TTITLE "ATTRIBUTES"
COLUMN table_name FORMAT A15 HEADING "TABLE NAME"
COLUMN column_name FORMAT A15 HEADING "ATTRIBUTE NAME"
COLUMN data_type FORMAT A8 HEADING "TYPE"
SELECT table_name,
       column_name,
       data_type,
       data_length "LENGTH",
       data_precision "PRECISION",
       data_scale "SCALE"
FROM   user_tab_columns
WHERE  table_name = upper('&TNAME')
ORDER BY user_tab_columns.table_name, column_name;
TTITLE "CONSTRAINTS"
SET LINESIZE 100
COLUMN table_name FORMAT A20 HEADING "TABLE NAME"
COLUMN constraint_name FORMAT A25 HEADING "CONSTRAINT"
COLUMN search_condition FORMAT A30 HEADING "CONDITION"
SELECT table_name,
       constraint_name,
       decode(constraint_type, 'P', 'PRIMARY KEY',
				'U', 'CANDIDATE KEY',
                                'R', 'FOREIGN KEY',
                                'C', 'DOMAIN:' )  TYPE, 
       search_condition
FROM   user_constraints
WHERE  user_constraints.table_name = upper('&TNAME')
ORDER BY table_name, constraint_name;
TTITLE "COLUMNS INVOLVED IN CONSTRAINTS"
SET LINESIZE 100
COLUMN table_name FORMAT A20 HEADING "TABLE NAME"
COLUMN constraint_name FORMAT A25 HEADING "CONSTRAINT"
COLUMN column_name FORMAT A10 HEADING "COLUMN"
COLUMN position FORMAT 99999999 HEADING "POSITION"
SELECT table_name,
       constraint_name,
       column_name,
       position
FROM   user_cons_columns
WHERE  table_name = upper('&TNAME')
ORDER BY user_cons_columns.table_name, constraint_name, position;
TTITLE "REFERENCES"
SET LINESIZE 100
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
       CONSTRAINT_TYPE = 'R' AND
       UCC1.TABLE_NAME= upper('&TNAME')
ORDER BY UCC1.TABLE_NAME, USER_CONSTRAINTS.CONSTRAINT_NAME;
PROMPT
TTITLE OFF
SET FEEDBACK ON
SET VERIFY ON

PROMPT Done.
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
