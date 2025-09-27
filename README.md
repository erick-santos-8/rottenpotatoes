# RottenPotatoes
Aplicação web desenvolvida em Ruby on Rails para gerenciar um banco de dados de filmes, com base no livro ESaaS (Engineering Software as a Service) para a disciplina de Engenharia de Software.

# Tecnologias Utilizadas
+ Ruby on Rails 7+ - Framework web
+ SQLite3 - Banco de dados 
+ ERB - Templates de visualização
+ CSS3 - Estilização moderna com gradientes e animações

# Requisitos do Sistema
+ Ruby 3.0+
+ Rails 7.0+
+ SQLite3
+ Node.js 

# Instalação e Configuração
1. Clone o repositório
```
git clone <url-do-repositorio>
cd rottenpotatoes
```
2. Instale as dependências
```
bundle install
```
3. Configure o banco de dados
```
# Crie e migre o banco de dados
rake db:create
rake db:migrate

# Popule com dados iniciais
rake db:seed
```
4. Execute a aplicação
```
rails server
```
# Estrutura da Aplicação
## Modelos
+ Movie: Representa um filme com título, classificação, descrição e data de lançamento
## Controladores
+ MoviesController: Gerencia todas as operações CRUD para filmes
## Views Principais
+ index.html.erb - Lista todos os filmes com ordenação
+ show.html.erb - Detalhes de um filme específico
+ new.html.erb - Formulário para criar novo filme
+ edit.html.erb - Formulário para editar filme existente

# Rotas
```
GET    /movies          # Listar filmes
GET    /movies/new      # Formulário novo filme
POST   /movies          # Criar filme
GET    /movies/:id      # Ver filme
GET    /movies/:id/edit # Formulário editar filme
PATCH  /movies/:id      # Atualizar filme
DELETE /movies/:id      # Excluir filme
```

# Funcionalidades
## Ordenação Interativa
+ Clique em "Movie Title" para ordenar alfabeticamente
+ Clique em "Release Date" para ordenar por data
+ Coluna ativa destacada visualmente

## Sistema de Classificação
### Classificações baseadas no livro ESaaS:
    - G - General Audiences
    - PG - Parental Guidance Suggested
    - PG-13 - Parents Strongly Cautioned
    - R - Restricted
    - NC-17 - Adults Only

### Validações
+ Título obrigatório
+ Classificação deve estar na lista permitida
+ Data de lançamento obrigatória