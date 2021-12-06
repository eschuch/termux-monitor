#/bin/bash
#
# Instalador simples.
# Verifica algumas dependências, instala o que for preciso e inicia o serviço.
# 
pkg install wget -y
pkg install curl -y
pkg install unzip -y

mkdir -p ~/bin
cd ~/bin
wget https://codeload.github.com/eschuch/termux-monitor/zip/refs/heads/main -O termux-monitor.zip
unzip termux-monitor.zip
mkdir -p ~/.termux/boot/
ln -s start-monitor.sh ~/.termux/boot/start-monitor.sh
chmod +x monitor.sh start-monitor.sh telegram.sh
#
#
nano monitor.sh
nano telegram.sh
./start-monitor.sh &
