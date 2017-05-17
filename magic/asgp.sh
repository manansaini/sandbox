#!/bin/ksh
if [ -z $1 ] || [ -z $2 ] ; then
print "\nUSAGE: $0 [MetaProject] [Project]\n\nfor example: asgp wmmutualfunds mfoe\n"
exit
fi
MetaProj=$( echo $1 | tr '[:upper:]' '[:lower:]' )
Proj=$( echo $2 | tr '[:upper:]' '[:lower:]')
cd /ms/dist/$MetaProj/PROJ/$Proj/
ls --color=always -ltr
printf "Would you like to generate vms command (y/n): "
read answer
if [ $( echo $answer | tr [:upper:] [:lower:] ) == "y"  ]; then
printf "\nEnter the Release Number (e.g: 2016.04.11-3):"
read ReleaseNum
printf "\nEnter the Release Link (e.g: uat/prod):"
read ReleaseLink
printf "\nEnter the TCM Number (e.g:123456789):"
read tcm
echo vms turnover releaselink $1 $2 $ReleaseNum $ReleaseLink -- -global -comment "tcm=$tcm"
else
        exit
fi
exec ksh
