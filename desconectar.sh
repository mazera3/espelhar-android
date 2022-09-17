#!/bin/bash
## adb disconnect $IP:5555
echo -e "*** Este script desconecta o celular \n para que possa espelhar outro ***"
read -p "Digite o IP do Celular a ser desconectado ou [ENTER]: [192.168.1.15] " IP

if [ -z $IP ]; then
    IP="192.168.1.15"
    echo "Vamos utilizar o IP padrão: $IP."
else
    echo "Você digitou o IP: $IP."
    read -p "Pressione [ENTER] para continuar ou [CTRL+C] para sair ..."
fi
adb disconnect $IP:5555
sleep 3
