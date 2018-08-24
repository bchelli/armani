/*
 History:
 +------+------------+-----------+-----------+-------------------------------------------------+
 | Ver# | Date       | By        | Defect #  | Description                                     |
 +------+------------+-----------+-----------+-------------------------------------------------+
 | 2    | 02-18-2005 | Vikram    | 104665    | Added SECURITY menu                             |
 -----------------------------------------------------------------------------------------------
 *
 * formatted with JxBeauty (c) johann.langhofer@nextra.at
 */


package com.chelseasystems.cs.swing.menu;

import com.chelseasystems.cr.appmgr.*;
import com.chelseasystems.cr.appmgr.state.*;


/**
 * Comments generated by AppBuilder. Do not modify.
 * 0. com.chelseasystems.cs.swing.login.InitialLoginApplet
 * 1. com.chelseasystems.cs.swing.menu.InitialLayawayMenuApplet
 * 2. com.chelseasystems.cs.swing.menu.TransactionMgmtMenuApplet
 * 3. com.chelseasystems.cs.swing.menu.EmployeeMgmtMenuApplet
 * 4. com.chelseasystems.cs.swing.menu.ReportsMgmtMenuApplet
 * 5. com.chelseasystems.cs.swing.session.EndOfSession
 * 6. com.chelseasystems.cs.swing.session.EndofDayApplet
 * 7. com.chelseasystems.cs.swing.timecard.IdentifyEmployeeApplet
 * 8. <code>null</code>
 * 9. com.chelseasystems.cs.swing.goaling.GoalingEntryApplet
 * 10. com.chelseasystems.cs.swing.management.SystemUtilitiesApplet
 * 11. com.chelseasystems.cs.swing.employee.EmployeeAccessApplet
 */
public class InitialMgmtMenuApplet_State {

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int CANCEL(IApplicationManager theAppMgr)
      throws StateException {
    //
    // put state logic here
    //
    throw new StateException("State change not implemented->CANCEL");
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int EMP_MGMT(IApplicationManager theAppMgr)
      throws StateException {
    return 3;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int END_DAY(IApplicationManager theAppMgr)
      throws StateException {
    return 6;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int END_SESSION(IApplicationManager theAppMgr)
      throws StateException {
    return 5;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int GOAL_ENTRY(IApplicationManager theAppMgr)
      throws StateException {
    return 9;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int LAY_MGMT(IApplicationManager theAppMgr)
      throws StateException {
    return 1;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int OK(IApplicationManager theAppMgr)
      throws StateException {
    //
    // put state logic here
    //
    throw new StateException("State change not implemented->OK");
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int PREV(IApplicationManager theAppMgr)
      throws StateException {
    return 0;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int REPORT_MENU(IApplicationManager theAppMgr)
      throws StateException {
    return 4;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int TIMECARD_MGMT(IApplicationManager theAppMgr)
      throws StateException {
    return 7;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int TRANS_MGMT(IApplicationManager theAppMgr)
      throws StateException {
    return 2;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int VIEW_RECEIPT_LOG(IApplicationManager theAppMgr)
      throws StateException {
    return 8;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int SYSTEM_UTILS(IApplicationManager theAppMgr)
      throws StateException {
    //
    // put state logic here
    //
    return 10;
  }

  /**
   * SECURITY
   *
   * Description: to provide for User Management - Security
   * Created By: Vikram Mundhra
   * Created Date: 04/18/2005
   *
   * @param theAppMgr IApplicationManager
   * @return int
   * @author Vikram Mundhra
   */
  /*
   HISTORY
   Ver     Date        By      Spec        Description
   1       04/18/05    VM      Comments    Created
   */
  public int SECURITY(IApplicationManager theAppMgr)
      throws StateException {
    return 11;
  }

  /**
   * put your documentation comment here
   * @param theAppMgr
   * @return
   * @exception StateException
   */
  public int BUY_BACK(IApplicationManager theAppMgr)
      throws StateException {
    return 12;
  }

  public int MODIFY_FISCAL_NUM(IApplicationManager theAppMgr)
      throws StateException {
    return -1;
  }

}
