# Script de automação - Server

Script para automação de config inicial de servidor, criando:
- Diretórios
- Grupos
- Usuários
- Instalação e Configuração de webserver Apache
- Deploy de site de exemplo

## 1. Configurações Básicas do S.O.

### 1.1. Antes de executar

Deve-se preencher os arquivos de parâmetros, conforme abaixo:
- dirs.txt -> Diretórios que serão criados
- groups.txt -> Grupos que serão criados
- usersXgroups.txt -> Usuários e os grupos aos quais pertencerão, no formato "usuário grupo", um por linha. Exemplo: carlos GRP_ADM.

### 1.2. Executando o script

```shell
sudo ./script.sh
```

### 1.3. Testando em uma VM usando vagrant

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
## 2. Intalação de Webserver Apache e Deploy de Site

### 2.1. Execução do script

```shell
sudo ./webserver.sh
```

### 2.2. Testando em uma VM usando vagrant

Os passos iniciais são os mesmos descritos na seção [**1.3. Testando em uma VM usando vagrant**](#13-testando-em-uma-vm-usando-vagrant). A diferença está na execução do script, que é o denominado **webserver.sh**.

Não há necessidade de rodar os passos inciais, caso a VM já esteja rodando, apenas a execução do sript **webserver.sh** é necessária nesse caso.