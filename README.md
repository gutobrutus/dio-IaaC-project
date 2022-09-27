# Script de automação - Server

Script para automação de config inicial de servidor, criando:
- Diretórios
- Grupos
- Usuários

## Antes de executar

Deve-se preencher os arquivos de parâmetros, conforme abaixo:
- dirs.txt -> Diretórios que serão criados
- groups.txt -> Grupos que serão criados
- usersXgroups.txt -> Usuários e os grupos aos quais pertencerão, no formato "usuário grupo", um por linha. Exemplo: carlos GRP_ADM.

## Executando o script

```shell
sudo ./script.sh
```

## Testando em uma VM usando vagrant

Primeiro execute na raiz deste projeto:

```shell
vagrant up && vagrant ssh
```

Após finalizar o comando anterior, estará logado na VM. Acesse o diretório /vagrant

```shell
cd /vagrant
```
Esse é diretório mapeado dentro da VM co o conteúdo com os arquivos deste projeto.

Execute o script: 

```shell
sudo ./script.sh
```
