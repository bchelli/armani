ALTER TABLE ARM_STG_TXN_DTL
MODIFY (LINE_ITEM_TYPE VARCHAR2(2),
     ITM_RTL_PRICE NUMBER(10,2),
     ITM_SEL_PRICE NUMBER(10,2),
     MANUAL_MD_AMT NUMBER(10,2),
     MANUAL_UNIT_PRICE NUMBER(10,2),
     RETURN_COMMENTS VARCHAR2(200),
     VAT_RATE NUMBER(10,5),
     NET_AMT  NUMBER(10,2),
     TAX_AMT  NUMBER(10,2),
     DEAL_MKDN_AMT NUMBER(10,2),
     REDUCTION_AMOUNT NUMBER(10,2),
     DSC_AMOUNT	NUMBER(10,2),
     TND_AMOUNT NUMBER(10,2),
     FC_XCHANGE_RATE NUMBER(10,2),
     RDM_FACE_VALUE_AMT NUMBER(10,2),
     RDM_BALANCE_AMT NUMBER(10,2),
     RDM_BUYBACK_AMT NUMBER(10,2),
     CUST_ADDR_2 VARCHAR2(60),
     OPENING_DRWR_FND NUMBER(10,2),
     EOD_TND_TYPE VARCHAR2(50)
);

ALTER TABLE ARM_STG_CUST_IN
MODIFY (DBYTE_FIRST_NM VARCHAR2(60),
	DBYTE_LAST_NM  VARCHAR2(60),
	REAL_BIRTHDAY  DATE,
	ADDRESS_LINE_1 VARCHAR2(60),
	ADDRESS_LINE_2 VARCHAR2(60)
);

ALTER TABLE ARM_STG_CUST_OUT
MODIFY (DB_FIRST_NM	VARCHAR2(60),
	DB_LAST_NM	VARCHAR2(60),
	REAL_BIRTHDAY	DATE,
	ADDRESS_LINE_1	VARCHAR2(60),
	ADDRESS_LINE_2	VARCHAR2(60)
);

ALTER TABLE ARM_STG_FISCAL_DOC
MODIFY (ADDRESS_2	VARCHAR2(60),
	COUNTY		VARCHAR2(30)
);

ALTER TABLE ARM_STG_FISCAL_DOC
ADD FISCAL_DATE DATE;

ALTER TABLE ARM_STG_RSVO_CSGO
MODIFY CUST_ADDRRESS_LINE_2 VARCHAR2(60);

ALTER TABLE ARM_STG_TXN_HDR
MODIFY (ASIS_COMMENTS VARCHAR2(200),
	REDUCTION_AMOUNT NUMBER(10,2),
	NET_AMOUNT NUMBER(10,2)
);

ALTER TABLE ARM_STG_TXN_HDR
ADD (ASIS_ORDER_NO VARCHAR2(50),
     ASIS_ORDER_DATE DATE,
     ASIS_SUPPLIER_NO VARCHAR2(50),
     ASIS_SUPPLIER_DATE DATE,
     ASIS_NOTES VARCHAR2(200)
);

ALTER TABLE ARM_STG_TXN_HIST
MODIFY (CUST_ADDR_LINE_2 VARCHAR2(60),
	RDM_CONTROL_NUMBER NUMBER
);

ALTER TABLE ARM_MISC_LOOKUP
ADD CURRENCY_CD CHAR(3) DEFAULT 'USD';

ALTER TABLE ARM_STG_ITEM
ADD FILE_IDENTIFIER VARCHAR2(128);

DROP SEQUENCE PURGE_TXN_SEQ;

CREATE SEQUENCE PURGE_TXN_SEQ START WITH 100 INCREMENT BY 1;

DROP TABLE ARM_TXN_PURGE_PROCESS_LOG;

CREATE TABLE ARM_TXN_PURGE_PROCESS_LOG
(
  SEQ_ID        NUMBER(7),
  TXN_ID        VARCHAR2(128),
  REF_TXN_ID    VARCHAR2(128),
  STATUS        NUMBER(1),
  LOAD_DATE     DATE,
  PROCESS_DATE  DATE
);

DROP SYNONYM &&2..ARM_TXN_PURGE_PROCESS_LOG;

CREATE SYNONYM &&2..ARM_TXN_PURGE_PROCESS_LOG FOR &&1..ARM_TXN_PURGE_PROCESS_LOG;

DROP SYNONYM &&2..PURGE_TXN_SEQ;

CREATE SYNONYM &&2..PURGE_TXN_SEQ FOR &&1..PURGE_TXN_SEQ;

GRANT ALL ON &&2..ARM_TXN_PURGE_PROCESS_LOG TO &&2;

GRANT ALL ON &&2..PURGE_TXN_SEQ TO &&2;

