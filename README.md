
# Teste Ruby On Rails

Esse projeto consiste em um teste, feito com ruby on rails.


## Stack utilizada

**Front-end:** html, scss, css , bootstrap

**Back-end:** Ruby, Ruby on Rails


## Configuração do Ambiente
Certifique-se de ter o ambiente Ruby on Rails configurado corretamente.


## Clone

faça o clone do projeto 

```bash
  git clone https://github.com/nadodev/teste_ruby_on_rails.git
 
```

## Instalação

Instale as libs com  bundle

```bash
  cd teste_ruby_on_rails
  bundle install
```

## Configure o banco de dados:

Rode as migrations com 

```bash
  rails db:migrate
```
    
## Iniciar o projeto

```bash
  rails server
```

# Atenção
-  Para um bom funcionamento do projeto, cadastre um Autor antes do post



## Funcionalidades

- CRUD de posts
- CRUD Authors
- Validações de campos obrigatórios
- Busca de posts
- Post relacionado atravez de API
- Teste Ingregração

## Rodar os Teste

```bash
  bundle exec rspec
