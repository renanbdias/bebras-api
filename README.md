# Bebras-BR 1.0 - API

>URL Base - Produção: 

>URL Base - Staging: 

Todas requisições precisam da indicação de qual versão será utilizada após a `URL Base`.

Exemplo: `#`

## Instalação do Projeto
------------------------

### Dependências

 - Ruby v2.4.1
     - Caso não tenha Ruby intalado em sua máquina, recomendamos o uso do [RVM](https://rvm.io/) para a instalação do mesmo.
 - Rails v5.0
 - MySQL
 - Git e Git Flow
 <!-- - ImageMagick. Comando Ubuntu: `sudo apt-get install imagemagick libmagickwand-dev` -->
 <!-- - Sidekiq -->

**Download**

Acesse via terminal o local dos seus projetos e faça o clone do repositório.
```bash
$ git clone git@git.facom.ufms.br:fabrica_software_2018/Bebras_Team/bebras-api.git
```

Para utilização do ambiente de desenvolvimento configure o Git Flow.
```bash
$ sudo apt-get install git-flow
$ git flow init
```
Pressione Enter para todas as opções que serão exibidas. Depois disso você já estara na branch de development.

Caso opte por não utilizar Git Flow, é necessário fazer o download da branch `develop` remota.

**Configuração do Gemset**

Dentro da pasta do projeto, crie os arquivos `.ruby-version` e `.ruby-gemset` e depois entre novamente na pasta para que a RVM carregue as novas configurações.
```bash
$ echo "ruby-2.4.1" > .ruby-version
$ echo "bebras-api" > .ruby-gemset
$ cd .
```

**Instalação das dependências**

A ferramenta `bundle` instalará todas as gems que foram definidas no Gemset do projeto.
```bash
$ gem install bundle
$ bundle install
```

**Configuração do banco de dados**

Primeiramente é necessário criar o arquivo de setup de banco: `config/database.yml`.
```bash
$ touch config/database.yml
```

Depois copie o conteúdo do arquivo de exemplo `config/database.example.yml`, cole no novo arquivo e altere o usuário e senha de acordo com seu MySQL local assim como o nome dos bancos.

Por fim, crie o banco de dados, rode as migrations e popule o mesmo.

```bash
$ rake db:create db:migrate db:seed
```

**Testes**

Utilizamos o framework de testes Rspec para execução de testes.

```bash
$ rspec
```

**Start do servidor**
```bash
$ rails s
```

**Start do servidor liberado para a rede**
```bash
$ rails s -b 0.0.0.0
```

# Documentação (API)

