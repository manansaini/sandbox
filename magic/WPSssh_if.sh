#!/bin/ksh
# This is first script written by Mananpreet Singh.
# Please do no run this if you don't know what it does.
# version 1.0
module load fsf/tmux/1.6

print "\nChoose the type of deployment(case-sentive):\n\nBWF\nConnect\nMinerva\n"
read type
print "\n\n"
echo  "Choose the environment name for deployment(case-senstive):"
 print "\nQA\nQA01\nQAPE\n"
  read env
  print "\n\n"
if [[ $type == BWF ]]
 then

        if [[ $env == QA ]]
                then
                hosts="vmias70537.devin3.ms.com vmias70538.devin3.ms.com vmias70539.devin3.ms.com"
                split=50
            elif [[ $env == QA01 ]]
                then
                 hosts="vmias70550.devin3.ms.com vmias70551.devin3.ms.com vmias70552.devin3.ms.com"
                split=50
            elif [[ $env == QAPE ]]
                then
                hosts="iapp5.howard.ms.com iapp6.howard.ms.com iapp7.howard.ms.com iapp3.randolph.ms.com iapp4.randolph.ms.com"
                split=55
                else
                print "Please choose the correct Environment or enter the name correctly as shown above, Environment name is case-sentive.\n"
        fi
elif [[ $type == Connect ]]
 then
        if [[ $env == QA ]]
                then
                hosts="ivapp76247.devin3.ms.com ivapp76248.devin3.ms.com ivapp76249.devin3.ms.com"
                split=50
            elif [[ $env == QA01 ]]
                then
                hosts="ivapp77764.devin3.ms.com ivapp77766.devin3.ms.com ivapp77767.devin3.ms.com"
                split=50
            elif [[ $env == QAPE ]]
                then
                hosts="iapp13.randolph.ms.com iapp13.howard.ms.com iapp73.randolph.ms.com"
                split=50
                else
                print "Please choose the correct Environment or enter the name correctly as shown above, Environment name is case-sentive.\n"
        fi
elif [[ $type == Minerva ]]
 then
        if [[ $env == QA ]]
                then
                hosts="ivapp76193.devin3.ms.com ivapp77762.devin3.ms.com ivapp77763.devin3.ms.com"
                split=50

            elif [[ $env == QA01 ]]
                then
                hosts="ivapp1100635.devin3.ms.com ivapp1082896.devin3.ms.com ivapp1082897.devin3.ms.com"
                split=50

            elif [[ $env == QAPE ]]
                then
                hosts="iapp12.randolph.ms.com iapp12.howard.ms.com iapp74.randolph.ms.com"
                split=50
                else
                print "Please choose the correct Environment or enter the name correctly as shown above, Environment name is case-sentive.\n"
        fi
fi
print "You chose $type $env:"
for HOSTNAME in ${hosts} ; do
 if [ -z "$panenumber" ]; then
       tmux new-window -n "Script written by Manan" "ssh $HOSTNAME"
       panenumber=0
   else
        if [ $panenumber == 1 ]; then
       tmux split-window -v -p 50  "ssh $HOSTNAME"
        else
       tmux split-window -h -p $split "ssh $HOSTNAME"
        fi
   fi
 panenumber=$(($panenumber + 1))
   if [ $(( $panenumber % 10 )) -eq 0 ]; then
       tmux select-layout tiled
   fi
done
tmux select-pane -U
exit
