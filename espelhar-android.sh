#!/bin/bash
## espelha o celular no Linux Ubuntu
## sudo apt install scrcpy
echo "habilitar wifi para espelhar o celular no computador"
sleep 1
echo "Conecte o cabo do carregador na porta usb no PC e no celular"
sleep 3
read -p "Pressione [Enter] para continuar ..."
echo "Configurando a porta 5555"
sleep 1
adb tcpip 5555
sleep 1
read -p "Dê permissão ao celular, desconecte o cabo e pressione [Enter] para continuar ..."
read -p "Digite o IP do seu Celular ou pressione ENTER: [192.168.1.24] " IP

if [ -z $IP ]; then
    IP="192.168.1.24"
    echo "Vamos utilizar o IP $IP"
else
    read -p "Você digitou o IP: $IP. Pressione ENTER para continuar ou CTRL+C para sair ..."
fi
sleep 1
echo "Conectando ao IP $IP"
adb connect $IP:5555
sleep 3
scrcpy
