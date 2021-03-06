WHENEVER SQLERROR EXIT 1
WHENEVER OSERROR EXIT 2
SET SERVEROUT ON
BEGIN
    DECLARE
        INTERFACE_KEY VARCHAR2(100);
	FAILEDRECORD INTEGER := 0;
	PROCESSEDRECORD INTEGER := 0;
    BEGIN
        INTERFACE_KEY := '&1';
        VALIDATE_INTERFACES.VALIDATE(
                INTERFACE_KEY
              , FAILEDRECORD
              , PROCESSEDRECORD
        );
        DBMS_OUTPUT.PUT_LINE(START_TIME);
    END;
END;
/
EXIT 0
/
