/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Subject:            CSCI235 Databases
    Script name:        list.sql
    Written by:         Dr Janusz R. Getta
    Task:               To list the names of relational tables owned by a user
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SET LINESIZE 30
SET PAGESIZE 100
SET FEEDBACK OFF
TTITLE "USER TABLES"
COLUMN table_name FORMAT A30 HEADING "TABLE NAME"
select table_name
from   user_tables;
COLUMN table_name CLEAR;
PROMPT
TTITLE OFF;
SET FEEDBACK ON

PROMPT Done.
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
