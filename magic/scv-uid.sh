#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: April_1_2016
# Script can be used to perform following operation for scv keys
        # To find the UID of multiple dot net scv keys
        # To find the UID of multiple dot net dmz scv keys
        # To find the Password of multiple Java scv keys
        # To find the Password of multiple Java dmz scv keys

module load sec/ssq/default
module load sec/scvdmz
clear
echo "----------------------------------------------"
echo " * * * * * * * Main Menu * * * * * * * * * * "
echo "----------------------------------------------"
echo "[1] To find UID of dot net SCV keys [except DMZ keys]"
echo "[2] To find UID of dot net DMZ SCV keys"
echo "[3] To find the Password of multiple Java scv keys"
echo "[4] To find the Password of multiple Java dmz scv keys"
echo
echo -n "Enter your menu choice [1-4]: "
read choice
echo
printf %s "Please enter the namespace environment: "
read nsenv
print "\nEnter SCV key names and press ctrl+d when done:\n"
scvkeynames=$(cat)
echo "$scvkeynames" > "scvkeyslist.txt"
file="scvkeyslist.txt"
case $choice in
1 )
print "\nUID of above keys are:\n"
while read line
 do
{
output="$(ssq  tell gwm/credentials/dotnet/$nsenv $line)"
echo "$output" | awk -F\" '{print $12}'
}
done < "$file"
;;
2 )
print "\nUID of above keys are:\n"
while read line
 do
{
output="$(scvdmz  tell gwm/credentials/dotnet/$nsenv $line)"
echo "$output" | awk -F\" '{print $12}'
}
done < "$file"
;;
3 )
print "\nPassword of above keys are:\n"
while read line
do
{
output="$(ssq tell AIS/AES/WMDW/$nsenv/CREDENTIALS $line)"
echo "$output"
}
done < "$file"
;;
4 )
print "\nPassword of above keys are:\n"
while read line
do
{
output="$(scvdmz tell AIS/AES/WMDW/$nsenv/CREDENTIALS $line)"
echo "$output"
}
done < "$file"
;;
esac
