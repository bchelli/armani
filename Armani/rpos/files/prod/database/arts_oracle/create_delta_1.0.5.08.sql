alter table ARM_TAX_RATE
    modify TAX_RATE number(10,5);

alter table rk_prm_itm
add (dc_prm_ep date, effective_dt date
);

alter table as_itm
add size_index varchar2(50);

ALTER TABLE AS_ITM
MODIFY (MODEL VARCHAR2(50), FABRIC VARCHAR2(50));

CREATE OR REPLACE VIEW RK_ITEM_VW
(ID_ITM, BARCODE, ID_STR_RT, RETAIL_VALUE, MARKDOWN_VALUE, 
 TAXABLE_VALUE, VAT_RATE, FY, SEASON, DE_SEASON, 
 ID_BRN, NM_BRN, LABEL, NM_LABEL, SUBLINE, 
 DE_SUBLINE, GENDER, DE_GENDER, CATEGORY, NM_CATEGORY, 
 ITEM_DROP, DE_DROP, VARIANT, ID_SIZE, DE_SIZE, 
 SIZE_INDEX, EXT_SIZE_INDEX, ID_SIZE_KIDS, DE_SIZE_KIDS, ID_SPR, 
 NM_SPR, MODEL, FABRIC, ID_COLOR, DE_COLOR, 
 PRODUCT_NUM, DE_PRODUCT, NM_ITM, ID_DPT_POS, NM_DPT_POS, 
 ID_CLASS, NM_CLASS, ID_SBCL, NM_SBCL, STYLE_NUM, 
 SC_ITM_SLS, CURRENCY_CODE, FL_EN_PRC_RQ, ID_RU_PRDV, PRM_EXP_DT, QU_AVAILABLE, 
 QU_UNAVAILABLE, QU_STORE_AVAILABLE, QU_STORE_UNAVAILABLE, NM_ORGN, UPDATE_DT)
AS 
SELECT 
AS_ITM.ID_ITM			ID_ITM 
, AS_ITM.BARCODE		BARCODE 
, AS_ITM_RTL_STR.ID_STR_RT	ID_STR_RT 
, HISTORY_TABLE_RETAIL.VALUE	RETAIL_VALUE 
, HISTORY_TABLE_MARKDOWN.VALUE	MARKDOWN_VALUE 
, HISTORY_TABLE_TAXABLE.VALUE	TAXABLE_VALUE 
, HISTORY_TABLE_VAT.VALUE	VAT_RATE 
, AS_ITM.FY			FY 
, AS_ITM.ID_SEASON		SEASON 
, ARM_SEASON.DE_SEASON		DE_SEASON 
, AS_ITM.ID_BRN			ID_BRN 
, ARM_BRN.NM_BRN		NM_BRN 
, AS_ITM.LABEL			LABEL 
, ARM_LABEL.NM_LABEL		NM_LABEL 
, AS_ITM.SUBLINE		SUBLINE 
, ARM_SUBLINE.DE_SUBLINE	DE_SUBLINE 
, AS_ITM.GENDER			GENDER 
, ARM_GENDER.DE_GENDER		DE_GENDER 
, AS_ITM.CATEGORY		CATEGORY 
, ARM_CATEGORY.NM_CATEGORY	NM_CATEGORY 
, AS_ITM.ITEM_DROP		ITEM_DROP 
, ARM_DROP.DE_DROP		DE_DROP 
, AS_ITM.VARIANT		VARIANT 
, AS_ITM.ID_SIZE		ID_SIZE 
, ARM_SIZE.DE_SIZE		DE_SIZE 
, AS_ITM.SIZE_INDEX		SIZE_INDEX 
, ARM_SIZE.EXT_SIZE_INDEX	EXT_SIZE_INDEX 
, AS_ITM.ID_KIDS_SIZE		ID_SIZE_KIDS 
, ARM_KIDS_SIZE.DE_SIZE		DE_SIZE_KIDS 
, AS_ITM.ID_SPR			ID_SPR 
, ARM_SPR.NM_SPR		NM_SPR 
, AS_ITM.MODEL			MODEL 
, AS_ITM.FABRIC			FABRIC 
, AS_ITM.ID_COLOR		ID_COLOR 
, ARM_COLOR.DE_COLOR		DE_COLOR 
, AS_ITM.PRODUCT_NUM		PRODUCT_NUM 
, ARM_PRODUCT.DE_PRODUCT	DE_PRODUCT 
, AS_ITM.NM_ITM			NM_ITM 
, AS_ITM.ID_DPT_POS		ID_DPT_POS 
, ID_DPT_PS.NM_DPT_POS		NM_DPT_POS 
, AS_ITM.ID_CLSS		ID_CLASS 
, ARM_CLASS.NM_CLSS		NM_CLASS 
, AS_ITM.ID_SBCL		ID_SBCL 
, ARM_SUBCLASS.NM_SBCL		NM_SBCL 
, AS_ITM.STYLE_NUM		STYLE_NUM 
, HISTORY_TABLE_STATUS.VALUE	SC_ITM_SLS 
, AS_ITM_RTL_STR.currency_code Currency_code 
, HISTORY_TABLE_MANUAL_PRICE.VALUE	FL_EN_PRC_RQ 
, RK_PRM_ITM.ID_RU_PRDV		ID_RU_PRDV 
, RK_PRM_ITM.DC_PRM_EP		PRM_EXP_DT
, NVL(ARM_ITM_SOH.QU_AVAILABLE,0) QU_AVAILABLE 
, NVL(ARM_ITM_SOH.QU_UNAVAILABLE,0) QU_UNAVAILABLE 
, NVL(ARM_ITM_SOH.QU_STORE_AVAILABLE,0) QU_STORE_AVAILABLE 
, NVL(ARM_ITM_SOH.QU_STORE_UNAVAILABLE,0) QU_STORE_UNAVAILABLE 
,PA_ORGN.NM_ORGN NM_ORGN 
, AS_ITM_RTL_STR.UPDATE_DT	UPDATE_DT 
FROM 
AS_ITM INNER JOIN 
( 
	AS_ITM_RTL_STR INNER JOIN PA_PRTY ON AS_ITM_RTL_STR.ID_STR_RT = 
PA_PRTY.ID_PRTY 
	LEFT OUTER JOIN RK_PRM_ITM ON (AS_ITM_RTL_STR.ID_ITM=RK_PRM_ITM.ID_ITM AND 
	AS_ITM_RTL_STR.ID_STR_RT=RK_PRM_ITM.ID_STR_RT) 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_RETAIL ON 
	(HISTORY_TABLE_RETAIL.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_RETAIL.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_RETAIL.KEY='RETAIL_PRICE' ) 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_MARKDOWN ON 
	(HISTORY_TABLE_MARKDOWN.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_MARKDOWN.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_MARKDOWN.KEY='MARKDOWN' ) 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_TAXABLE ON 
	(HISTORY_TABLE_TAXABLE.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_TAXABLE.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_TAXABLE.KEY='TAXABLE' ) 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_STATUS ON 
	(HISTORY_TABLE_STATUS.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_STATUS.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_STATUS.KEY='STATUS' ) 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_VAT ON 
	(HISTORY_TABLE_VAT.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_VAT.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_VAT.KEY='VAT_RATE') 
	LEFT OUTER JOIN ARM_ITM_HIST_NOW HISTORY_TABLE_MANUAL_PRICE ON 
	(HISTORY_TABLE_MANUAL_PRICE.ID_ITM=AS_ITM_RTL_STR.ID_ITM 
	AND HISTORY_TABLE_MANUAL_PRICE.ID_STR_RT=AS_ITM_RTL_STR.ID_STR_RT AND 
	HISTORY_TABLE_MANUAL_PRICE.KEY='MANUAL_PRICE_ENTRY') 
) 
ON AS_ITM.ID_ITM = AS_ITM_RTL_STR.ID_ITM 
LEFT OUTER JOIN ARM_BRN ON (AS_ITM.ID_BRN=ARM_BRN.ID_BRN AND 
PA_PRTY.ED_LA=ARM_BRN.ED_LA AND PA_PRTY.ED_CO=ARM_BRN.ED_CO) 
LEFT OUTER JOIN ID_DPT_PS ON (AS_ITM.ID_DPT_POS= ID_DPT_PS.ID_DPT_POS) 
LEFT OUTER JOIN ARM_CLASS ON (AS_ITM.ID_CLSS=ARM_CLASS.ID_CLSS AND 
AS_ITM.ID_DPT_POS= ARM_CLASS.ID_DPT) 
LEFT OUTER JOIN ARM_SUBCLASS ON (AS_ITM.ID_DPT_POS=ARM_SUBCLASS.ID_DPT AND 
AS_ITM.ID_CLSS=ARM_SUBCLASS.ID_CLSS AND AS_ITM.ID_SBCL=ARM_SUBCLASS.ID_SBCL) 
LEFT OUTER JOIN ARM_SEASON ON (AS_ITM.ID_SEASON=ARM_SEASON.ID_SEASON AND 
PA_PRTY.ED_LA=ARM_BRN.ED_LA AND PA_PRTY.ED_CO=ARM_SEASON.ED_CO) 
LEFT OUTER JOIN ARM_COLOR ON (AS_ITM.ID_COLOR=ARM_COLOR.ID_COLOR) 
LEFT OUTER JOIN ARM_SIZE ON (AS_ITM.ID_SIZE=ARM_SIZE.ID_SIZE AND AS_ITM.SIZE_INDEX=ARM_SIZE.SIZE_INDEX
AND PA_PRTY.ED_LA=ARM_SIZE.ED_LA AND PA_PRTY.ED_CO=ARM_SIZE.ED_CO) 
LEFT OUTER JOIN ARM_KIDS_SIZE ON (AS_ITM.ID_SIZE=ARM_KIDS_SIZE.ID_SIZE AND 
PA_PRTY.ED_LA=ARM_KIDS_SIZE.ED_LA AND PA_PRTY.ED_CO=ARM_KIDS_SIZE.ED_CO) 
LEFT OUTER JOIN ARM_SUBLINE ON (AS_ITM.SUBLINE=ARM_SUBLINE.ID_SUBLINE AND 
PA_PRTY.ED_LA=ARM_SUBLINE.ED_LA AND PA_PRTY.ED_CO=ARM_SUBLINE.ED_CO) 
LEFT OUTER JOIN ARM_GENDER ON (AS_ITM.GENDER=ARM_GENDER.ID_GENDER AND 
PA_PRTY.ED_LA=ARM_GENDER.ED_LA AND PA_PRTY.ED_CO=ARM_GENDER.ED_CO) 
LEFT OUTER JOIN ARM_CATEGORY ON (AS_ITM.CATEGORY=ARM_CATEGORY.ID_CATEGORY 
AND PA_PRTY.ED_LA=ARM_CATEGORY.ED_LA AND PA_PRTY.ED_CO=ARM_CATEGORY.ED_CO) 
LEFT OUTER JOIN ARM_DROP ON (AS_ITM.ITEM_DROP=ARM_DROP.ID_DROP AND 
PA_PRTY.ED_LA=ARM_DROP.ED_LA AND PA_PRTY.ED_CO=ARM_DROP.ED_CO) 
LEFT OUTER JOIN ARM_PRODUCT ON (AS_ITM.PRODUCT_NUM=ARM_PRODUCT.ID_PRODUCT) 
LEFT OUTER JOIN ARM_SPR ON (AS_ITM.ID_SPR=ARM_SPR.ID_SPR) 
LEFT OUTER JOIN ARM_LABEL ON (AS_ITM.LABEL=ARM_LABEL.ID_LABEL AND 
PA_PRTY.ED_LA=ARM_LABEL.ED_LA AND PA_PRTY.ED_CO=ARM_LABEL.ED_CO) 
LEFT OUTER JOIN ARM_ITM_SOH ON (ARM_ITM_SOH.ITEM_ID = AS_ITM_RTL_STR.ID_ITM AND ARM_ITM_SOH.STORE_ID=AS_ITM_RTL_STR.ID_STR_RT) 
INNER JOIN PA_ORGN ON PA_ORGN.ID_PRTY_ORGN = AS_ITM_RTL_STR.ID_STR_RT;




