#/bin/bash
#
# Instalador simples.
# Verifica algumas dependências, instala o que for preciso e inicia o serviço.
# Para executar, execute a linha abaixo num shell termux:
# wget https://raw.githubusercontent.com/eschuch/termux-monitor/main/install.sh -O - | bash
# 
pkg install wget -y
pkg install curl -y
pkg install unzip -y

mkdir -p ~/bin
cd ~/bin
wget https://codeload.github.com/eschuch/termux-monitor/zip/refs/heads/main -O termux-monitor.zip
unzip termux-monitor.zip
mv termux-monitor-main/* ./
rm -rf termux-monitor-main termux-monitor.zip
mkdir -p ~/.termux/boot/
ln -s boot-monitor.sh ~/.termux/boot/boot-monitor.sh
chmod +x monitor.sh boot-monitor.sh telegram.sh
#
#
echo Edite primeiro o arquivo 
echo nano ~/bin/monitor.sh
echo Depois o arquivo:
echo nano ~/bin/telegram.sh
echo Inicie o servico reiniciando o box ou com o comando
echo ~/bin/start-monitor.sh\ \&
echo "################"
