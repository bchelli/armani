#!/bin/sh

cd ./Tax
rm stg_tax_rt.log
rm stg_tax_rt.bad
echo ------------------
echo Parameters passed:
echo ------------------
Ext_User=$1
echo Ext_User  $Ext_User
Ext_Pass=$2
echo Ext_Pass  $Ext_Pass
Ext_DB=$3
echo Ext_DB $Ext_DB
Data_File=$4
echo Data_File $Data_File
Reg_User=$5
echo Reg_User $Reg_User
Reg_Pass=$6
echo Reg_Pass $Reg_Pass
Reg_DB=$7
echo Reg_DB $Reg_DB
Start_Time=$8
echo Start_Time $Start_Time
error_code=0
sqlldr  $Ext_User/$Ext_Pass@$Ext_DB control=stg_tax_rt.ctl data=$Data_File bad=stg_tax_rt.bad log=stg_tax_rt.log 1>outputLog.txt 2>errorLog.txt
error_code=$?
#if [ "$?" -ne 0 ]
#then
 #   error_code=$?
#fi
echo The log created by the SQL Loader is:
#cat ../log/stg_tax_rt.log
date_string=`date '+%a %m/%d/%Y %H:%M:%S'`
sqlplus $Reg_User/$Reg_Pass@$Reg_DB @call_load_tax_rt.sql TAX $Start_Time $Data_File 1>outputLog.txt 2>errorLog.txt
if [ "$?" -ne 0 ]
then
    exit "$?"
fi
exit $error_code
