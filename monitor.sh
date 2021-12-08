#!/data/data/com.termux/files/usr/bin/sh

# Original de
# https://stackoverflow.com/questions/4708631/modify-shell-script-to-monitor-ping-multiple-ip-addresses
###########################################

thispath=`dirname ${0}`
${thispath}/config.sh

trap exit 2
while true; do
  i=1
  for ipnumber in "${iplist}"; do
    statusname=up$i
    laststatus=${!statusname:-0}
    ping -c 1 -t 2 $ipnumber > /dev/null
    ok=$?
    eval $statusname=$ok
    if [ ${!statusname} -ne $laststatus ]; then
      
      if [ $ok -eq 0 ]; then
        echo ${thishost} - $ipnumber mudou para UP
	      ${thispath}/telegram.sh "${thishost} - $ipnumber mudou para UP"
      else
        echo ${thishost} - $ipnumber mudou para DOWN
	      ${thispath}/telegram.sh "${thishost} - $ipnumber mudou para DOWN"
      fi
    fi
    i=$(($i + 1))
  done
  sleep 5
done
