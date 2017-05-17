#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: May_5_2016

module load ecm/tcm2cli/1.0
if [ $1 ]; then
output="$(tcm2 lr $1 -full 2>&1)"
print "\n  TCM #          State                   TurnOver Date & Time (Timezone)                 TurnOver Duration\n"
echo "$output" | grep -E 'TcmId|State|TurnoverDateTime|Timezone|TurnoverDuration'|awk 'BEGIN{ORS=","}{print $2" " $3}'|awk -F, '{print $2"      "$1"            "$4" ("$3")             "$5}'
echo
exit
else
# clear
echo
echo "----------------------------------------------"
echo " * * *  Find TCM Details of mass TCM  * * * * "
echo " * * *    Enter  One TCM per line     * * * * "
echo " * * *       Written by Manan         * * * * "
echo "----------------------------------------------"
echo
print "Enter TCM Numbers (one per line) and press Ctrl+d when done:\n"
keyvariable=$(cat)
echo "$keyvariable" > "tcmlist.txt"
print "\nYour TCM's information is as below:\n"
file="tcmlist.txt"
print "  TCM #          State                   TurnOver Date & Time (Timezone)                 TurnOver Duration\n"
while read line
do
{
output="$(tcm2 lr $line -full 2>&1)"
# echo "$output" | sed -n -e 14p -e 's/^.*Turnover://p'
# echo "$output" | sed -n -e's/created by.*//p' -e's/^.*Turnover:/Scheduled on /p'
# echo "$output" |sed -n -e's/created by.*//p' -e's/^.*Turnover:/Scheduled on /p'|tr "\r\n" ','
echo "$output" | grep -E 'TcmId|State|TurnoverDateTime|Timezone|TurnoverDuration'|awk 'BEGIN{ORS=","}{print $2" " $3}'|awk -F, '{print $2"      "$1"            "$4" ("$3")"$5}'
echo
}
done < "$file"
fi
