#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/sh

# Script simples para iniciar os serviços.
# espera que além do termux, seja instalado o termux:boot e este escript esteja na pasta:
# ~/.termux/boot/start-monitor.sh
# os demais arquivos esperaśe que estejam na pasta:
# ~/bin/
##############################

termux-wake-lock &
sshd &
