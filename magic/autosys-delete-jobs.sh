#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: September_9_2016
# This script will delete the Autosys jobs
echo
echo "---------------------------------------------------------------"
echo " * * *      This script will DELETE Autosys Jobs       * * * * "
echo " * * *   Enter One Job name  per line & Press ctrl+d   * * * * "
echo " * * *                Written by Manan                 * * * * "
echo "---------------------------------------------------------------"
echo
hname="$(hostname)"
printf "\nEnter the Autosys Job Environment(DEV/QA/UAT/PROD): "
read asenv
case "$asenv" in
        "DEV" | "dev" | "QA" | "qa" )
        module load 3rd/autosys/NYT
        ;;
        "UAT" | "uat" )
        module load 3rd/autosys/NYQ
        ;;
        "PROD" | "prod" )
        module load 3rd/autosys/NYA
        ;;
        * )
        print "\nYou choose the wrong environment, Please try again.\n"
        exit 1;
esac
print "\n\nEnter Autosys job names that you want to delete & Press ctrl+d once done:\n"
asjobnames=$(cat)
echo "$asjobnames" > "temp.txt"
file="temp.txt"
print "\n\nDeleting above autosys jobs:\n"
while read a
do
{
b="$(autorep -J $a -q|grep owner | awk -F[:@] 'NR==1{print $2}' )"
#print $a $output
print as_chownmach  -J  $a --owner $b -M $hname
as_chownmach  -J  $a --owner $b -M $hname
print sendevent -E DELETEJOB -J $a --owner $b
sendevent -E DELETEJOB -J $a --owner $b
print "\n\n---------------------------------------------------------------\n\n"
#output="$(autorep -J $a -q|grep owner )"
#name=$a
#print "$output" | awk -F: '{ print $2 }' | awk -F'@' '{print $1}'
#print "$output" | awk -F[:@]  '{ print $2 }'
}
done < "$file"

