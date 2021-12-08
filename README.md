# termux-monitor
Script para monitorar por ping uma rede local e mandar notificação por telegram.

Este aplicativo verifica o estado dos ips na rede local e envia notificação via Telegram quando existe a troca de estado de algum dos serviços.

Para instalar:

Instale o pacote termux:
https://f-droid.org/en/packages/com.termux/

e o pacote termux:boot
https://f-droid.org/en/packages/com.termux.boot/

1. Abra o termux:boot ao menos uma vez para registrar o servico.
![Termux:Boot 1st Load](https://github.com/eschuch/termux-monitor/blob/main/img/1st%20login%20termux%20boot.png)

2. Abra o termux e execute os seguintes comandos:
curl https://raw.githubusercontent.com/eschuch/termux-monitor/main/install.sh -o - | sh

3. Siga mais informações na tela da aplicação.
