#!/bin/ksh
# Written by Mananpreet Singh
# version 1.0
# Date: September_9_2016
#module load 3rd/autosys/NYT
print "\nEnter Autosys job names: \n"
asjobnames=$(cat)
echo "$asjobnames" > "temp.txt"

file="temp.txt"
print "\n\nAutosys jobs info: \n"
while read line
do
{
autorep -J $line
}
done < "$file"
