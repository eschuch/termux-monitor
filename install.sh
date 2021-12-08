#!/data/data/com.termux/files/usr/bin/sh
#

apt --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" update
apt --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
pkg update -y
pkg upgrade -y
pkg install openssh -y
pkg install curl -y
pkg install unzip -y

mkdir -p ~
mkdir -p ~/.termux/boot/

cd ~
curl https://codeload.github.com/eschuch/termux-monitor/zip/refs/heads/main -o - > termux-monitor.zip
unzip termux-monitor.zip
mv termux-monitor-main/* ./

chmod +x ~/monitor.sh ~/boot-monitor.sh ~/telegram.sh
cp ~/boot-monitor.sh ~/.termux/boot/boot-monitor.sh

echo -e "1234567890\n1234567890" | passwd

sshd &
clear

iplocal=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
userlocal=`whoami`
logmsg=`\
echo "Acesse pelo PUTTY:";\
echo "com o ip ${iplocal}";\
echo "porta 8022";\
echo "o usuário ${userlocal}";\
echo "senha 1234567890";\
`

dialog --title "Instalador" --msgbox "${logmsg}" 20 65

