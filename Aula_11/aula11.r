
library("tidyverse")



### teste com o babynames
install.packages("wordcloud2")
library(wordcloud2)
library(babynames)


babynames %>%
  filter(name %in% c("Diogo","Diego")) %>% 
  group_by(name, sex) %>% 
  summarise(n = sum(n))

### ver o que come�a com o Dio 
  babynames %>%
  filter(name %>% startsWith("Dio")) %>% 
  select(name, sex) %>% 
  distinct() # Select only unique/distinct rows from a data frame

babynames %>%
    filter(name == "Cecilia")

babynames %>%
  filter(year == 2011)

babynames %>%
  filter(year == 2011, name == "Cecilia")

babynames %>%
  filter(year == 2011) %>%     # use only one year
  filter(sex == "F") %>%       # use only one sex
  select(name, n) %>%          # select the two relevant variables: the name and how often it occurs
  top_n(100, n) %>%            # use only the top names or it could get too big
  wordcloud2(size = .3)

babynames %>%
  filter(year == 2002) %>%     # use only one year
  filter(sex == "M") %>%       # use only one sex
  select(name, n) %>%          # select the two relevant variables: the name and how often it occurs
  top_n(100, n) %>%            # use only the top names or it could get too big
  wordcloud2(size = .3)

?wordcloud2


# https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html
# https://curso-r.github.io/ragmatic-book/trabalhando-com-vetores-especiais.html
# http://sillasgonzaga.com/material/cdr/trabalhando-com-datas.html

library(magrittr)
library(lubridate)


### o R precisa de uma forcinha para datas 

### A fun��o mais importante para leitura de dados no
# lubridate � a ymd. Essa fun��o serve para ler qualquer 
# data de uma string no formato YYYY-MM-DD. 
# Essa fun��o � �til pois funciona com qualquer 
# separador entre os elementos da data e tamb�m porque
# temos uma fun��o para cada formato (mdy, dmy, dym, myd, ydm).

# Exemplo: dia-ano-m�s
data_um <- '16/11/05'
dym(data_um)


#  Exemplo: ano-m�s-dia
data_dois <- '2011-05-16'
ymd(data_dois)



### year, month, day, quarter, weekday, week: extraem componentes da data.
### years, months, days: adicionam tempos a uma data, 
# ajudando a criar vetores de datas. Por exemplo

ymd('2011-04-16') + months(0:8)
ymd('2011-04-16') + months(0:9)


# gerar vetor de datas separadas por mes
seq.Date(from = as_date("2020-01-01"),
         to = as_date("2020-12-01"),
         by = "1 month")

# gerar vetor de datas separadas por dia
seq.Date(from = as_date("2020-01-01"),
         to = as_date("2020-01-20"),
         by = "1 day")


# gerar vetor de datas separadas por 3 dias
seq.Date(from = as_date("2020-01-01"),
         to = as_date("2020-01-20"),
         by = "3 day")


# gerar um vetor de 7 semanas separados por 1 semana
seq.Date(from = as_date("2020-01-01"),
         length.out = 7, ### n�o sei exatamente a data que termina
         by = "1 week")

# diferentes separadores
datas <- c("01/12/2019", "20/11/2018", "30011990", "17-03-2000")
# parseando o vetor acima para Data
dmy(datas)


datas <- dmy_hms(c("01/12/2019 13:51:15", "20/11/2018 00:00:00", "30011990 080000", "17-03-2000 203000"))
datas

# extrair componentes da data:
# ano
year(datas)

# mes
month(datas)

# dia
day(datas)

# semana do ano
week(datas)


# dia da semana
wday(datas, label = TRUE)


#### opera��es


# adicionar 1 semana nas datas
datas + ddays(7)


# adicionar 3 meses
datas + ddays(90)



#Calcular a diferen�a de tempo entre duas datas:

data1 <- dmy_hms("08/02/1980 08:00:00")
data2 <- dmy_hms("18-03-2021 15:40:00")

dif <- data2 - data1
dif

# Por padr�o, o R retorna a diferen�a em dias, 
# mas em um objeto de classe difftime.

class(dif)

# Recomenda-se ent�o converter o output para a classe numeric:
  
as.numeric(dif)

# Caso se deseje calcular essa diferen�a
# em outras unidades de tempo, como meses 
# ou semanas, basta fazer a divis�o correspondente:
  
# converter para semanas
as.numeric(dif) / 7

# converter para meses
as.numeric(dif) / 30

# converter para anos
as.numeric(dif) / 365

## Arredondar datas:

# retornar a primeira data da semana:
floor_date(datas, "week")



##### Vamos animar mais?
## https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf 

install.packages("knitr")
library(knitr)
install.packages("tinytex")
tinytex::install_tinytex()
