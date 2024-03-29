# Precisamos manipular dados!!

# https://curso-r.github.io/ragmatic-book/transformacao-de-dados.html
# https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
#  https://livro.curso-r.com/7-1-tibbles.html
#  https://r4ds.had.co.nz/tibbles.html

# https://livro.curso-r.com/7-2-dplyr.html

install.packages("tibble")

library(tibble)

data(mtcars)

# H� duas formas de criar uma tibble. 
# - transformar um data frame em tibble utilizando a fun��o as_tibble().

as_tibble(mtcars)

# ao contr�rio dos data frames, tibbles n�o utilizam nome nas linhas.

mtcars

# - a segunda forma de criar uma tibble � a partir de 
# vetores individuais, utilizando a fun��o tibble()

# aula 3 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cec�lia" , "Diogo", "Heitor", "Jo�o"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO"),
  stringsAsFactors = FALSE)

resultado_tibble <- tibble(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cec�lia" , "Diogo", "Heitor", "Jo�o"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)

resultado

resultado_tibble

# add_row() e add_column(): para adicionar linhas e colunas a uma tibble;

# rowid_to_column(): cria uma coluna com um id
# num�rico e sequencial para as linhas, come�ando de 1

mtcars %>% 
  rowid_to_column()


# has_rownames(): verifica se um data frame possui linhas nomeadas.
mtcars %>% 
  has_rownames()

# remove_rownames(): remove o nome das linhas de um data frame.
mtcars %>% 
  remove_rownames() ### removeu a primeira coluna 


### Aten��o!!!
# rownames_to_column(): transforma o nome das linhas em uma coluna.
mtcars %>% 
  rownames_to_column(var = "modelo") %>% 
  head(6)

####### dplyr � o pacote mais �til para realizar transforma��o de dados

### principais fun��es do dplyr
  
### select() - seleciona colunas
### arrange() - ordena a base
### filter() - filtra linhas
### mutate() - cria/modifica colunas
### group_by() - agrupa a base
### summarise() - sumariza a base


# entra tibble e sai tibble
# uso intensivo do %>% 

### j� instalou?
install.packages("dplyr")

library(dplyr)

#### vamos para mtcars novamente?
testes_dplyr <- as.tibble(mtcars) 

testes_dplyr %>% 
  head(6)
# para selecionar colunas? select()

select(testes_dplyr, mpg)

select(testes_dplyr, mpg, hp) 

### e usando o pipe?

###usar o pipe e salvar o arquivo

testes_dplyr  %>%  select(mpg, hp) %>% head(10)

#### ainda mais colunas?  utilize o : 

select(testes_dplyr, mpg, hp:vs)

# o dplyr possui o conjunto de fun��es auxiliares
# muito �teis para sele��o de colunas. As principais s�o:
  
# starts_with(): para colunas que come�am com um texto padr�o
# ends_with(): para colunas que terminam com um texto padr�o
# contains(): para colunas que cont�m um texto padr�o

select(testes_dplyr, starts_with("c"))

select(testes_dplyr, ends_with("t"))

select(testes_dplyr, contains("e"))

# para retirar colunas da base, base acrescentar um - antes da sele��o

testes_dplyr_dois <- testes_dplyr %>%
  select(-drat, -carb, -am)

testes_dplyr_dois

# para ordenar linhas, utilizamos a fun��o arrange()

testes_dplyr_dois <- arrange(testes_dplyr_dois, cyl)

testes_dplyr_dois

# se quiser em ordem decrescente 

testes_dplyr_dois <- arrange(testes_dplyr_dois, desc(cyl))

testes_dplyr_dois

### para mais colunas

testes_dplyr_dois <- arrange(testes_dplyr_dois, mpg, cyl) ### ordena do mais forte pro mais fraco (mais � esquerda para mais � direita)

testes_dplyr_dois

testes_dplyr_dois <- arrange(testes_dplyr_dois, cyl, mpg)

### ordenou a cyl primeiro e depois a mpg "dentro"

testes_dplyr_dois

### Para filtrar valores filter()

testes_dplyr_dois %>%
           filter(mpg > 30)


### mostrar apenas duas colunas
 
 testes_dplyr_dois %>%
   filter(mpg > 30) %>%
   select(mpg, cyl)

### filtrar com condi��o em mais de uma coluna

 testes_dplyr_dois

 testes_dplyr_dois %>%
   filter(mpg > 30, hp > 70)

### podemos filtrar usando vari�vel 
 
 testes_dplyr_dois %>%
   filter(gear %in% c(5)) ### pode usar com caracter 
 

library(babynames)

data("babynames")

babynames

###  sumarizando a base 

bebes <- babynames %>% 
      filter(year == 2002) %>% 
      summarize(total_nascimento = sum(n, na.rm = TRUE)) 

bebes

###  como fazer por anos?

# group_by()

###  agrupar total por ano de nascimento 
bebes_ano <- babynames %>% 
  group_by(year) %>% 
  summarize(total_nascimento = sum(n, na.rm = TRUE)) 

bebes_ano

###  agrupar total por nome
bebes_nome <- babynames %>% 
  group_by(name) %>% 
  summarize(total_nascimento = sum(n, na.rm = TRUE))

bebes_nome

bebes_nome %>%  filter(name == "Raphael")

#####  Miss�o ... 

data("starwars")

starwars

star_sem_na <- starwars[!is.na(starwars$species),]
star_sem_na


sw_humans <- starwars %>% 
  filter(species == "Human") %>% 
  summarize(total_humanos = n()) 

sw_humans

sw_planets <- starwars %>% 
  select(homeworld, species)

sw_planets

sw_mass <- arrange(starwars, mass)
sw_mass

#### propor tr�s "mudan�as" 
# uma necessariamente com o summarise
# select() - seleciona colunas
# arrange() - ordena a base
# filter() - filtra linhas
# mutate() - cria/modifica colunas
# group_by() - agrupa a base
# summarise() - sumariza a base