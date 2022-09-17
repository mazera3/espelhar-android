#!/bin/bash
## espelha o celular no Linux Ubuntu
## sudo snap install scrcpy
## adb disconnect $IP:5555
scrcpy -v
echo "*** habilitar wifi para espelhar o celular no computador ***"
sleep 1
read -p $'Conecte o cabo do carregador na porta usb no PC \n e no celular e pressione [Enter] para continuar ...'
echo "Configurando a porta 5555"
sleep 1
adb tcpip 5555

while [ $? -ne 0 ]; do
    read -p "Conecte o cabo do carregador e pressione [ENTER] ..."
    adb tcpip 5555
    [ $? -eq 0 ]
done

read -p "Dê permissão ao celular, DESCONECTE o cabo e pressione [ENTER] ..."
read -p "Digite o IP do Celular ou [ENTER]: [192.168.1.15] " IP

if [ -z $IP ]; then
    IP="192.168.1.15"
    echo "Vamos utilizar o IP $IP"
else
    echo "Você digitou o IP: $IP."
    read -p "Pressione [ENTER] para continuar ou CTRL+C para sair ..."
fi
sleep 1
echo "Conectando ao IP $IP"
adb connect $IP:5555
sleep 1
scrcpy
