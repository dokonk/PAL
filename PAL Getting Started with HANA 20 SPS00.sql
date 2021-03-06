-- CHECK AFL PAL FUNCTIONS ARE INSTALLED
SELECT * FROM SYS.AFL_FUNCTIONS WHERE PACKAGE_NAME='PAL';

-- START SCRIPT SERVER
ALTER SYSTEM ALTER CONFIGURATION ('daemon.ini', 'SYSTEM') SET ('scriptserver', 'instances') = '1' WITH RECONFIGURE;

-- CREATE USER FOR AFL DEVELOPMENT
CREATE USER USER1 PASSWORD Password1;

-- AUTHORIZE CREATION & REMOVAL OF PAL PROCEDURES
GRANT AFLPM_CREATOR_ERASER_EXECUTE TO USER1;

-- AUTHORIZE EXECUTION OF PAL PROCEDURES
GRANT AFL__SYS_AFL_AFLPAL_EXECUTE TO USER1;

-- AUTHORIZE READ ACCESS TO INPUT DATA
GRANT SELECT ON SCHEMA DM_PAL TO USER1;
