CREATE OR REPLACE VIEW RK_TXN_HEADER ("CUST_ID",
    "TY_TRN","ID_STR_RT","TY_STR_RT","ID_OPR","TS_TRN_PRC",
    "TS_TRN_SBM","TY_GUI_TRN","PAY_TYPES","TOTAL_AMT","AI_TRN",
    "CONSULTANT_ID","REDUCTION_AMOUNT","NET_AMOUNT",
    "DISCOUNT_TYPES","ITEMS_IDS","REGISTER_ID","FN_PRS","LN_PRS",
    "EXP_DT","REF_ID","CURRENCY_CD","IS_SHIPPING") AS 
    SELECT RK_PAY_TRN.CUST_ID, TR_TRN.TY_TRN, TR_TRN.ID_STR_RT, 
    PA_STR_RTL.ID_BRAND, 
TR_TRN.ID_OPR, TR_TRN.TS_TRN_PRC, TR_TRN.TS_TRN_SBM, 
TR_TRN.TY_GUI_TRN, RK_PAY_TRN.PAY_TYPES, RK_PAY_TRN.TOTAL_AMT, 
RK_PAY_TRN.AI_TRN, PA_EM.ARM_EXTERNAL_ID CONSULTANT_ID, TR_RTL.REDUCTION_AMOUNT, 
TR_RTL.NET_AMOUNT, TR_RTL.DISCOUNT_TYPES, TR_RTL.ITEMS_IDS, 
TR_TRN.ID_RPSTY_TND, PA_PRS.FN_PRS, PA_PRS.LN_PRS, 
DECODE(RK_PAY_TRN.TYPE_ID, 'TRNPSO', ARM_POS_PRS.EXP_DT, 'TRNCGO', ARM_POS_CSG.EXP_DT, NULL) EXP_DT, 
DECODE(RK_PAY_TRN.TYPE_ID, 'TRNPSO', ARM_POS_PRS.ID_PRESALE, 'TRNCGO', ARM_POS_CSG.ID_CONSIGNMENT, NULL) REF_ID, 
PA_STR_RTL.TY_CNY CURRENCY_CD, 
DECODE(RK_SHIP_REQ.SEQ_NUM, NULL, 0, 1) IS_SHIPPING 
FROM TR_TRN INNER JOIN 
( 
 	 RK_PAY_TRN LEFT OUTER JOIN 
	 ( 
	 	 TR_RTL LEFT OUTER JOIN PA_PRS ON TR_RTL.CONSULTANT_ID = PA_PRS.ID_PRTY_PRS 
		 LEFT OUTER JOIN PA_EM ON TR_RTL.CONSULTANT_ID=PA_EM.ID_EM 
		 LEFT OUTER JOIN RK_SHIP_REQ ON (RK_SHIP_REQ.AI_TRN=TR_RTL.AI_TRN AND RK_SHIP_REQ.SEQ_NUM=0) 
		 LEFT OUTER JOIN ARM_POS_PRS ON TR_RTL.AI_TRN = ARM_POS_PRS.AI_TRN 
		 LEFT OUTER JOIN ARM_POS_CSG ON TR_RTL.AI_TRN = ARM_POS_CSG.AI_TRN 
	 ) 
	 ON RK_PAY_TRN.AI_TRN = TR_RTL.AI_TRN 
) 
ON TR_TRN.AI_TRN=RK_PAY_TRN.AI_TRN AND TR_TRN.TY_TRN IN ('TRNPAY') 
INNER JOIN PA_STR_RTL ON TR_TRN.ID_STR_RT=PA_STR_RTL.ID_STR_RT;

CREATE TABLE ARM_ALTERN_CLSS_GRP ( 
  GROUP_ID      VARCHAR2(30) , 
  SUB_GROUP_ID  VARCHAR2(30) 
); 

CREATE TABLE ARM_ALTERN_GRP ( 
  GROUP_ID   VARCHAR2(30) , 
  GROUP_NAME  VARCHAR2(50),
  ED_CO   VARCHAR2(20),
  ED_LA   VARCHAR2(20)
);

CREATE TABLE ARM_ALTERN_CODE ( 
  GROUP_ID     VARCHAR2(30) , 
  ALTERN_CODE  VARCHAR2(50) , 
  ALTERN_DESC  VARCHAR2(50) ,
  ALTERN_PRICE VARCHAR2(20),
  ALTERN_TIME  DATE         
); 

ALTER TABLE ARM_ALTERN_GRP
ADD  ( PRIMARY KEY (GROUP_ID) ) ;

ALTER TABLE ARM_ALTERN_CODE
ADD  ( PRIMARY KEY (GROUP_ID, ALTERN_CODE) ) ;

ALTER TABLE ARM_ALTERN_CLSS_GRP
ADD  ( FOREIGN KEY (GROUP_ID)
REFERENCES ARM_ALTERN_GRP) ;

ALTER TABLE ARM_ALTERN_CODE
ADD  ( FOREIGN KEY (GROUP_ID)
REFERENCES ARM_ALTERN_GRP) ;

CREATE TABLE ARM_CFG_DETAIL ( 
  TY_CFG  VARCHAR2(50) , 
  CD_CFG  VARCHAR2(50) , 
  ED_CO   VARCHAR2(20) , 
  ED_LA   VARCHAR2(20) , 
  DE_CFG  VARCHAR2(200),
  PRIORITY CHAR(3) DEFAULT '0' NOT NULL
) ;

ALTER TABLE ARM_CFG_DETAIL
ADD  ( PRIMARY KEY (TY_CFG, CD_CFG,ED_CO,ED_LA) ) ;
