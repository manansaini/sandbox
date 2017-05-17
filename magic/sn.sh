#!/bin/ksh
module load secdsg/utilities/snt

echo
echo "------------------------------------------------------------"
echo " * * *  Shows the REQ/RITM/TASK  of a given ticket  * * * * "
echo " * * *   Enter One Ticket per line & Press ctrl+d   * * * * "
echo " * * *                Written by Manan              * * * * "
echo "------------------------------------------------------------"
echo
print "Enter REQ/RITM/TASK(one per line) and press Ctrl+d when done:\n"
keyvariable=$(cat)
echo "$keyvariable" > "temp.txt"
file="temp.txt"
print "\n\nYour Ticket tree is as below:\n"
print "--------------------------------------------"
print "   TASK#      REQ#            RITM#"
print "--------------------------------------------\n"

while read line
do
{
TICKET=$line

REQ=""
RITM=""
TASK=""

if [ $( echo $TICKET | grep REQ ) ]; then
   REQ=$TICKET
elif [ $( echo $TICKET | grep RITM ) ]; then
   RITM=$TICKET
elif [ $( echo $TICKET | grep TASK ) ]; then
   TASK=$TICKET
else
   echo "Ticket must be a TASK, RITM, or REQ type"
   exit 1
fi
output="$(/ms/group/it/ect/service/webops/scripts/viewticket/vr $TICKET)"

echo "$output" | awk '/Associated Records/{print "  "$4,"       ",$5,"  ",$6}'
echo
}
done < "$file"
exit

