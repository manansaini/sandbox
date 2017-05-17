#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: May_5_2016

module load webinfra/lbcheck
if [ -z $1 ] || [ -z $2 ] ; then
echo
echo " USAGE: $0 [Virtual Name].[Port] [Owner FirstName / Lastname / shortid]"
echo
echo " for example: virtualown xyz-na.ms.com.80 mananprs"
echo
exit
fi
name=$2
value=$(lbcheck -virtual $1 | grep Owner)
echo
echo "-------------- Mailgroup Owner Check-------------"
echo $value | awk '{print $2}'
echo
echo "-------------- Virtual Owner Check -------------"
echo $(echo $value | awk '{print $2}' | phone | grep $name)
echo
echo "-------------- MSSB Cluster Check -------------"
/ms/dist/TaskActionSuite/PROJ/webops/prod/bin/mssb_cluster_check.pl --virtual $1
echo
