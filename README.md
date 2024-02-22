
# Descrição do Projeto: Teste Ruby on Rails com GitHub Actions

Este projeto consiste em um desafio de desenvolvimento utilizando Ruby on Rails, 
O foco é garantir as melhores práticas de codificação, aprimorar a automação e assegurar a qualidade do código.


## Principais Características e Tecnologias:

### Ruby on Rails:

Utilizaremos o Ruby on Rails devido à sua capacidade de proporcionar um desenvolvimento ágil e eficiente para aplicações web.
### GitHub Actions:

Implementaremos GitHub Actions para automação de testes. A cada commit, os testes serão executados automaticamente, garantindo que o código esteja em conformidade com as diretrizes estabelecidas.
### Testes Automatizados:

Os testes automatizados desempenharão um papel crucial no processo de desenvolvimento. Os casos de teste abrangentes serão escritos para garantir a estabilidade do sistema.

### Integração Contínua (CI):

A integração contínua será alcançada por meio da configuração adequada no GitHub Actions. Isso garantirá que o código seja integrado suavemente e esteja sempre em um estado utilizável.



# Configuração do Ambiente
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
- Github actions

## Rodar os Teste

```bash
  bundle exec rspec


## Screenshots
![Logo](https://i.ibb.co/dkMxpm2/Capturar1.png)

![Logo](https://i.ibb.co/f2g9t3x/Capturar2.png)
![Logo](https://i.ibb.co/cCGhx3p/Capturar3.png)