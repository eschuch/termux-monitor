#/bin/bash
#
# Instalador simples.
# Verifica algumas dependências, instala o que for preciso e inicia o serviço.
# Para executar, execute a linha abaixo num shell termux:
# wget https://raw.githubusercontent.com/eschuch/termux-monitor/main/install.sh -O - | bash
# 
apt --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" update
apt --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
pkg update -y
pkg upgrade -y
pkg install openssh -y
pkg install curl -y
pkg install unzip -y

mkdir -p ~/bin
mkdir -p ~/.termux/boot/

cd ~/bin
wget https://codeload.github.com/eschuch/termux-monitor/zip/refs/heads/main -O termux-monitor.zip
unzip termux-monitor.zip
mv termux-monitor-main/* ./

chmod +x ~/bin/monitor.sh ~/bin/boot-monitor.sh ~/bin/telegram.sh
cp ~/bin/boot-monitor.sh ~/.termux/boot/boot-monitor.sh


rm -rf termux-monitor-main termux-monitor.zip

#
#

sshd &
clear
echo -----------------------------------------------------------------------
echo -e "1234567890\n1234567890" | passwd
echo Acesse pelo PUTTY:
echo com o ip `ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
echo porta 8022
echo o usuário `whoami`
echo senha 1234567890
echo ""
echo e altere os arquivos:
echo nano bin/monitor.sh
echo e o arquivo
echo nano bin/telegram.sh
echo ""
echo Reinicie o serviço com o comando
echo ""
echo killall bash ; ./bin/boot-monitor.sh &
echo "-----------------------------------------------------------------------"
read m
