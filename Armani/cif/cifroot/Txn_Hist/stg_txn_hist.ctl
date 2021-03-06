load data
    into table ARM_STG_TXN_HIST APPEND
    fields terminated by "|" optionally enclosed by '"'
    trailing nullcols
    (
	RECORD_TYPE,
	TRANSACTION_ID,
	TRANSACTION_TYPE,
	TRANSACTION_DATE "to_date(:TRANSACTION_DATE,'YYYYMMDDHH24MISS')",
	STORE_ID,
	REGISTER_NO,
	OPERATOR_ID,
	ASSOCIATE_ID,
	TXN_NET_AMOUNT "ARM_TO_NUMBER(:TXN_NET_AMOUNT,:CURRENCY_CD)",
	LINE_ITEM_TYPE,
	ITEM_ID,
	MISC_ITEM_ID,
	QUANTITY,
	CURRENCY_CD,
	RETAIL_PRICE "ARM_TO_NUMBER(:RETAIL_PRICE,:CURRENCY_CD)",
	SELLING_PRICE "ARM_TO_NUMBER(:SELLING_PRICE,:CURRENCY_CD)",
	MANUAL_MARKDOWN_AMT "ARM_TO_NUMBER(:MANUAL_MARKDOWN_AMT,:CURRENCY_CD)",
	MANUAL_UNIT_PRICE "ARM_TO_NUMBER(:MANUAL_UNIT_PRICE,:CURRENCY_CD)",
	REDUCTION_AMT "ARM_TO_NUMBER(:REDUCTION_AMT,:CURRENCY_CD)",
	REDUCTION_REASON,
	LN_ITM_NET_AMT "ARM_TO_NUMBER(:LN_ITM_NET_AMT,:CURRENCY_CD)",
	LN_ITM_TAX_AMT "ARM_TO_NUMBER(:LN_ITM_TAX_AMT,:CURRENCY_CD)",
	TAX_EXEMPT_ID,
	MANUAL_TAX_AMT "ARM_TO_NUMBER(:MANUAL_TAX_AMT,:CURRENCY_CD)",
	RETURN_REASON_ID,
	RETURN_COMMENTS,
	ORIG_TRANSACTION_ID,
	ORIG_STORE_ID,
	ORIG_PROCESS_DT  "to_date(:ORIG_PROCESS_DT,'YYYYMMDDHH24MISS')",
	ORIG_OPERATOR_ID,
	ORIG_REGISTER_ID,
	CUST_ROLE,
	EXT_CUST_ID,
	CUST_FIRST_NAME,
	CUST_LAST_NAME,
	CUST_ADDR_LINE_1,
	CUST_ADDR_LINE_2,
	CUST_CITY,
	CUST_STATE,
	CUST_COUNTRY,
	CUST_PCODE,
	CUST_PHONE_1,
	CUST_PHONE_2,
	TND_TYPE,
	TND_AMOUNT,
	TND_ID_ACNT_NMB,
	TND_RESP_AUTH,
	TND_APPROVAL_DATE  "to_date(:TND_APPROVAL_DATE,'YYYYMMDD')",
	TND_EXPIRATION_DT  "to_date(:TND_EXPIRATION_DT,'YYYYMMDD')",
	TND_HOLDER_NAME,
	CC_CVV_CODE,
	CC_AMEX_CID_NUM,
	TND_SWIPE_IND,
	TND_RESP_ADDRESS_VERIF,
	TND_RESP_JOURNAL_KEY,
	TND_RESP_MSG,
	TND_RESP_MSG_NUM,
	TND_MERCHANT_ID,
	TND_CARD_IDNFR,
	CC_CARD_PLAN,
	TND_MANUAL_OVERRIDE,
	CHK_ABA_NUM,
	CHK_ROUTING_NUM,
	CHK_BANK,
	CHK_IS_SCANNED,
	RDM_TYPE,
	RDM_CONTROL_NUMBER,
	RDM_TND_ID_STR_RT,
	RDM_DC_CPN_SCAN_CODE,
	RDM_TND_PRM_CODE,
	RDM_EXPIRATION_DATE   "to_date(:RDM_EXPIRATION_DATE,'YYYYMMDD')",
	STG_LOAD_DATE "SYSDATE",
	STG_EVENT_ID "STG_EVENT_ID_S.nextval",
	STG_STATUS "NVL(:STG_STATUS,0)"
    )
