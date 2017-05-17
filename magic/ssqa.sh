#!/bin/ksh
module load sec/ssq/default
if [ -z $1 ] || [ -z $2 ] || [ -z $3 ] ; then
echo
echo " USAGE: $0 [SSQ_operations] [net/java/rar/pass] [DEV/QA/UAT/PROD] [keyname]"
echo
echo " for example: ssqa tell net dev [keyname]"
echo
exit
fi
ENV=$( echo $3 | tr  '[:lower:]' '[:upper:]' )
case $2 in
net ) echo "ssq $1 gwm/credentials/dotnet/$3 $4 $5"; ssq $1 gwm/credentials/dotnet/$3 $4 $5;;
java ) echo "ssq $1 AIS/AES/WMJAVA/$ENV/CREDENTIALS $4 $5"; ssq $1 AIS/AES/WMJAVA/$ENV/CREDENTIALS $4 $5;;
rar ) echo "ssq $1 AIS/AES/WMDW/$ENV/CREDENTIALS $4 $5"; ssq $1 AIS/AES/WMDW/$ENV/CREDENTIALS $4 $5;;
pass ) echo "ssq $1 WMTTPQM/AIMDS/MISC/$ENV/SECRETS DB2-$4 $5"; ssq $1 WMTTPQM/AIMDS/MISC/$ENV/SECRETS DB2-$4 $5;;
* ) echo
echo " USAGE: $0 [SSQ_operations] [net/java/rar] [DEV/QA/UAT/PROD] [keyname]"
echo
echo " for example: ssqa tell net dev [keyname]"
echo
esac
