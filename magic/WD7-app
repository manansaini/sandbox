#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: Nov_28_2015
# Script can be used to perform following operation on Windeploy 7 - application
        # To check the ProID against DB
        # pull server names
        # recycle app pool
        # publish application

module load laf/windeploymswm/prod
clear
echo "----------------------------------------------"
echo " * * * * * * * Main Menu * * * * * * * * * * "
echo "----------------------------------------------"
echo "[1] Check ProID"
echo "[2] Find Server names"
echo "[3] See App logs"
echo
echo -n "Enter your menu choice [1-2]:"
read choice
case $choice in
1 )
        print "\nPlease enter the full application name along with environment: \n(for example: ebc-rls.webfarm.ms.com/rls/qa-2):"
        read appname
        print "\nPlease enter the proid:"
        read proid
        app get $appname | grep $proid
        ;;
2 )
        print "\nPlease enter the full application name along with environment: \n(for example: ebc-rls.webfarm.ms.com/rls/qa-2):"
        read appname
        app getservers $appname
        ;;
3 )
        print "\nPlease enter the full application name along with environment: \n(for example: ebc-rls.webfarm.ms.com/rls/qa-2):"
        read appname
        print "\nNumber of logs you want to see:"
        read num
        app getlogs $appname --- {Limit: $num}
        ;;

esac
