#!/bin/ksh
# This is the first script written by Mananpreet Singh.
# Please do no run this if you don't know what it does.
# version 1.0
# Date: Nov_28_2015

module load fsf/tmux/1.9a
function sleeping {
sleep 5
}
clear
print "\nChoose the type of deployment(not case-sentive):\033[1;33m\n\nBWF\nCONNECT\nMINERVA\n\033[0m"
read type
print "\n\n"
print  "Choose the environment name for deployment(not case-senstive):\033[1;32m \nQA07\nQA01\nQAPE\nPROD\n\033[0m"
read env
printf "\n\nYou chose \033[1;33m $type \033[0m deployment for \033[1;32m $env \033[0m environment, If this is correct please type (yes/no): "
read response

if [ "$response" == "yes" ]; then
case "$type" in
  "BWF" | "bwf" )

        case "$env" in
          "QA07" | "qa07" )
                hosts="vmias70537.devin3.ms.com vmias70538.devin3.ms.com vmias70539.devin3.ms.com"
                split=50
          ;;

          "QA01" | "qa01" )
                 hosts="vmias70550.devin3.ms.com vmias70551.devin3.ms.com vmias70552.devin3.ms.com"
                 split=50
        ;;

          "QAPE" | "qape" )
                hosts="iapp5.howard.ms.com iapp6.howard.ms.com iapp7.howard.ms.com iapp3.randolph.ms.com iapp4.randolph.ms.com"
                split=70
        ;;

          "PROD" | "prod" )
                hosts="iapp9.howard.ms.com iapp10.howard.ms.com iapp11.howard.ms.com iapp9.randolph.ms.com iapp10.randolph.ms.com iapp11.randolph.ms.com"
                 split=80
        ;;

           * )
                print "\n\nYou either chose the wrong deployment Type/Environment or entered the name incorrectly, Please wait for 5 seconds script will execute again.\n"
                sleeping
                exec ~mananprs/bin/WPS_ssh.sh
        ;;
        esac
  ;;

 "CONNECT" | "connect" )

        case "$env" in
          "QA07" | "qa07" )
                hosts="ivapp76247.devin3.ms.com ivapp76248.devin3.ms.com ivapp76249.devin3.ms.com"
                split=50
          ;;
          "QA01" | "qa01" )
                hosts="ivapp77764.devin3.ms.com ivapp77766.devin3.ms.com ivapp77767.devin3.ms.com"
                split=50
        ;;
          "QAPE" | "qape" )
                hosts="iapp13.randolph.ms.com iapp13.howard.ms.com iapp73.randolph.ms.com"
                split=50
        ;;

          "PROD" | "prod" )
                hosts="iapp140.howard.ms.com iapp140.howard.ms.com iapp117.randolph.ms.com"
                split=50
        ;;

           * )
                print "\n\nYou either chose the wrong deployment Type/Environment or entered the name incorrectly, Please wait for 5 seconds script will execute again.\n"
                sleeping
                exec ~mananprs/bin/WPS_ssh.sh
        ;;
        esac
  ;;

"MINERVA" | minerva )

        case "$env" in
          "QA07" | "qa07" )
                hosts="ivapp76193.devin3.ms.com ivapp77762.devin3.ms.com ivapp77763.devin3.ms.com"
                split=50
        ;;
        "QA01" | "qa01" )
                hosts="ivapp1100635.devin3.ms.com ivapp1082896.devin3.ms.com ivapp1082897.devin3.ms.com"
                split=50
       ;;
          "QAPE" | "qape" )
                hosts="iapp12.randolph.ms.com iapp12.howard.ms.com iapp74.randolph.ms.com"
                split=50
        ;;

          "PROD" | "prod" )
        hosts="iapp92.howard.ms.com iapp93.howard.ms.com iapp116.randolph.ms.com"
                split=50
        ;;

           * )
                print "\n\nYou either chose the wrong deployment Type/Environment or entered the name incorrectly, Please wait for 5 seconds script will execute again.\n"
                sleeping
                exec ~mananprs/bin/WPS_ssh.sh
        ;;
        esac
     ;;

           * )
                print "\n\nYou either chose the wrong deployment Type/Environment or entered the name incorrectly, Please wait for 5 seconds script will execute again.\n"
                sleeping
                exec ~mananprs/bin/WPS_ssh.sh
   ;;

esac

for HOSTNAME in ${hosts} ; do
 if [ -z "$panenumber" ]; then
       tmux new-window -n "Script written by Manan" "ssh $HOSTNAME"
       panenumber=0
  else
       if [ $panenumber == 1 ]; then
       tmux split-window -h -p 50  "ssh $HOSTNAME"
        else
       tmux split-window -v -p $split "ssh $HOSTNAME"
        fi
   fi
 panenumber=$(($panenumber + 1))
   if [ $(( $panenumber % 10 )) -eq 0 ]; then
       tmux select-layout tiled
   fi
done
tmux set-option -g mode-mouse on
tmux set-option -g mouse-resize-pane on
tmux set-option -g mouse-select-pane on
tmux select-pane -t 0
else
print "\n\nYou chose not to continue. Thanks for using this script.\n";
fi
exit
