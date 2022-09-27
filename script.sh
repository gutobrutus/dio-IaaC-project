#!/usr/bin/env bash

#Criando diretórios padrões
echo "[+] Criando diretórios a partir dos nomes no dirs.txt"

for dir_name in $(cat dirs.txt); do
    echo "Criando diretório ${dir_name}"
    mkdir $dir_name
done

#Criando grupos
echo "[+] Criando grupos a partir dos nomes no groups.txt"

for group_name in $(cat groups.txt); do
    echo "Criando grupo ${group_name}"
    groupadd $group_name
done

#Criando usuários e adicionando aos respectivos grupos
echo "[+] Gerando comandos de criação de usuários..."
awk '{print "useradd " $1 " -m -s /bin/bash -G " $2}' usersXgroups.txt > commands.sh

echo "[+] Criando usuários adicionando aos grupos a partir dos comandos gerados no passo anterior"
sed -i '1 i\#!/usr/bin/env bash \n' commands.sh
chmod +x commands.sh
./commands.sh

PASSWORD="Senha123"
for user in $(awk '{print $1}' usersXgroups.txt); do
    echo "[+] Alterando a senha de $user para a senha padrão"
    echo "$user:$PASSWORD" | chpasswd
    echo "  [->] Forçar $user trocar a senha no primeiro login "
    chage -d 0 $user
done

#Definindo permissões para os diretórios
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chmod 777 /publico
