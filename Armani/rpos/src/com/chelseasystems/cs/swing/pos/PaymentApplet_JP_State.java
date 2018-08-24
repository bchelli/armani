/*
 * put your module comment here
 * formatted with JxBeauty (c) johann.langhofer@nextra.at
 */

package com.chelseasystems.cs.swing.pos;

import com.chelseasystems.cr.appmgr.*;
import com.chelseasystems.cr.appmgr.state.*;
import com.chelseasystems.cr.paidout.PaidOutTransaction;
import com.chelseasystems.cr.collection.CollectionTransaction;
import com.chelseasystems.cs.pos.CMSCompositePOSTransaction;
import com.chelseasystems.cs.pos.CMSTransactionPOSHelper;
import com.chelseasystems.cs.swing.menu.*;
import com.chelseasystems.cr.pos.RedeemableBuyBackTransaction;

/**
 * Comments generated by AppBuilder. Do not modify. 
 * 0. com.chelseasystems.cs.swing.login.InitialLoginApplet 
 * 1. com.chelseasystems.cs.swing.pos.InitialSaleApplet
 * 2. com.chelseasystems.cs.swing.menu.PosMenuApplet
 */
public class PaymentApplet_JP_State {

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CANCEL(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CANCEL_TXN(IApplicationManager theAppMgr) throws StateException {
		if (theAppMgr.getStateObject("CASHIER_SESSION") != null)
			return 2;
		theAppMgr.goHome();
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int DEL_PAY(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int MAN_OVERRIDE(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int OK(IApplicationManager theAppMgr) throws StateException {
		if (theAppMgr.getStateObject("CASHIER_SESSION") != null)
			return 2;
		theAppMgr.goHome();
		return -1;
	}

	/**
	 * Do not actually go anywhere with this button. The applet should call IApplicationManager.goHome() if posting is successful.
	 */
	public int POST_TXN(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * Goto previous screen
	 */
	public int PREV(IApplicationManager theAppMgr) throws StateException {
		// always return to the previous screen
		if (theAppMgr.getStateObject("POST_COMPLETE") != null) {
			return -1;
		}
		Object txn = theAppMgr.getStateObject("TXN_POS");
		if (txn instanceof CollectionTransaction)
			return 5;
		if (txn instanceof PaidOutTransaction)
			return 6;
		if (txn instanceof RedeemableBuyBackTransaction)
			return 7;
		return 4;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int PRINT_GIFT(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int PRINT_RECEIPT(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int PRINT_STUB(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int PRINT_ALL_GIFT(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int PRINT_SELECT_ITEMS(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int RETURN_TO_PAYMENTS(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CUST_SALE_HIDDEN(IApplicationManager theAppMgr) throws StateException {
		theAppMgr.addStateObject("ARM_DIRECTED_FROM", "PAYMENT_APPLET");
		theAppMgr.addStateObject("ARM_DIRECT_TO", "PAYMENT_APPLET");
		theAppMgr.addStateObject("ARM_CUST_REQUIRED", "TRUE");
		return 3;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int INITIALSALE_HIDDEN(IApplicationManager theAppMgr) throws StateException {
		return 1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CREDIT_MEMO(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int GIFT_CERT(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CREDIT_CARD(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CHECK(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int CREDIT_MEMO_ISSUE(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int JPY_CASH(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int MFR_COUPON(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int STORE_VALUE_CARD(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int VIEW_CREDIT_CARD(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	/**
	 * put your documentation comment here
	 * 
	 * @param theAppMgr
	 * @return
	 * @exception StateException
	 */
	public int USE_CARD_ON_FILE(IApplicationManager theAppMgr) throws StateException {
		return -1;
	}

	public int NEW_TRANSACTION(IApplicationManager theAppMgr) throws StateException {
		return 9;
	}

}