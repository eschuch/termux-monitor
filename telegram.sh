#!/data/data/com.termux/files/usr/bin/sh

#Abra o bootfather do telegram e configura um bot_tokem e um group_ip e adicione abaixo:
GROUP_ID=group_id
BOT_TOKEN=bot_token


### Talves nao algterer abaixo
# this 3 checks (if) are not necessary but should be convenient
# Original de:
# https://hackernoon.com/how-to-create-a-simple-bash-shell-script-to-send-messages-on-telegram-lcz31bx

#echo ${1}

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"text message\""
  exit 0
fi

if [ -z "$1" ]
  then
    echo "Add message text as second arguments"
    exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "You can pass only one argument. For string with spaces put it on quotes"
    exit 0
fi

curl -s --data "text=$1" --data "chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
