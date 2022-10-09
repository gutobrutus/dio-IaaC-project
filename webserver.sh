#!/usr/bin/env bash

#Configurando para ignorar interação no terminal
export DEBIAN_FRONTEND=noninteractive

echo "[+] Update e Upgrade do APT"
apt update && apt upgrade -y

echo "[+] Instalação de pacotes necessários"
apt install apache2 unzip wget -y

echo "[+] Baixando o site"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "[+] Descompactando o site"
rm -rf linux-site-dio-main
unzip main.zip

echo "[+] Removendo main.zip"
rm -f main.zip

echo "[+] Copiando arquivos do site para a pasta pública web"
cd linux-site-dio-main/
cp -R * /var/www/html/
cd .. && rm -rf linux-site-dio-main

echo "[+] Configurando permissões na pasta pública web"
chown -R www-data:www-data /var/www/html

echo "[+] Aplicando hardening básico"
sed -i "s/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/" /etc/apache2/apache2.conf
sed -i "s/#LoadModule\ session_module/LoadModule\ session_module/" /etc/apache2/apache2.conf
sed -i "s/#LoadModule\ session_cookie_module/LoadModule\ session_cookie_module/" /etc/apache2/apache2.conf
sed -i "s/#LoadModule\ session_crypto_module/LoadModule\ session_crypto_module/" /etc/apache2/apache2.conf
sed -i "s/#LoadModule\ deflate_module/LoadModule\ deflate_module/" /etc/apache2/apache2.conf
sed -i "s/ServerTokens\ OS/ServerTokens\ Prod/" /etc/apache2/apache2.conf
sed -i "s/ServerSignature\ On/ServerSignature\ Off/" /etc/apache2/apache2.conf

echo "[+] Reiniciando o apache"
systemctl restart apache2