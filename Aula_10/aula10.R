library(tidyverse)

dados <- mtcars

dados <- dados %>% rownames_to_column("modelo") %>% 
  filter(cyl == 4) %>%
  mutate(hp_por_tonelada = hp/wt) %>%
  select(modelo,mpg,hp,wt,hp_por_tonelada) %>%
  arrange(desc(hp_por_tonelada))

### selecionar os cinco primeiros

dados %>% top_n(5, mpg)

### buscar algumas linhas
dados %>% slice(1,3,5)

### testagem?

dados %>% sample_frac(0.30, replace = F) %>%
  arrange(modelo)


#### pacote forcats
library(forcats)

### manual do pacote
### https://cran.r-project.org/web/packages/forcats/vignettes/forcats.html
### https://rstudio-pubs-static.s3.amazonaws.com/532992_7fe48ad3dbb84e3294614be9006758ae.html


### Fun��es que come�am com fct_, que recebem uma lista de fatores e devolvem um fator.
### Fun��es que come�am com lvl_, que modificam os n�veis de um fator.


### an�lise padr�o da cor dos cabelos
ggplot(starwars, aes(x = hair_color)) + 
  geom_bar() + 
  coord_flip()


### an�lise com o pacote
ggplot(starwars, aes(x = fct_infreq(hair_color, ))) + 
  geom_bar() + 
  coord_flip()

### sempre coloca o NA no topo

### cor da pele

starwars %>%
  count(skin_color, sort = TRUE)
## sort organiza do maior para menor

### organizando para apresentar apenas os 5 maiores
starwars %>%
  mutate(skin_color = fct_lump(skin_color, n = 5)) %>%
  count(skin_color, sort = TRUE)
# mutate cria coluna com as cinco maiores categorias 


### vamos manter as cores da pele que pelo menos 10% dos personagens t�m
starwars %>%
  mutate(skin_color = fct_lump(skin_color, prop = .1)) %>%
  count(skin_color, sort = TRUE)

### trocar o outros por um novo nome
starwars %>%
  mutate(skin_color = fct_lump(skin_color, prop = .1, other_level = "outros")) %>%
  count(skin_color, sort = TRUE)


### analisar o comportamento da massa corporal frente a cor do olho
### apresentar apenas as 6 cores de olhos mais populares e remover os NAs.

avg_mass_eye_color <- starwars %>%
  mutate(eye_color = fct_lump(eye_color, n = 6)) %>%
  group_by(eye_color) %>%
  summarise(mean_mass = mean(mass, na.rm = TRUE))

avg_mass_eye_color

### Parece que as pessoas (ou pelo menos uma pessoa)
# com olhos laranja s�o definitivamente mais pesadas.
# Se quis�ssemos fazer um gr�fico, seria bom se ele 
# fosse ordenado por mean_mass. Podemos fazer isso com 
# fct_reorder (), que reordena uma vari�vel por outra.

?fct_reorder

avg_mass_eye_color %>%
  mutate(eye_color = fct_reorder(eye_color, mean_mass)) %>%
  ggplot(aes(x = eye_color, y = mean_mass)) + 
  geom_col()




#### miss�o - ler dados do babynames e apresentar os cinco maiores
### usar o pacote forcats para babynames 
### stringr 



### refer�ncias 
# https://www.kaggle.com/hamelg/dplyr-in-r
# https://courses.cs.ut.ee/MTAT.03.183/2017_fall/uploads/Main/dplyr.html
# https://rstudio-pubs-static.s3.amazonaws.com/437983_4fe3dc615f7e4b2784767ae0a292b60d.html
# https://livro.curso-r.com/7-4-o-pacote-stringr.html

?stringr

### f�rmulas https://github.com/rstudio/cheatsheets/blob/master/strings.pdf

### fun��es

# str_length() VERSUS length(). 
# str_length() - n�mero de caracteres 
# length() - retorna o comprimento do objeto


sudeste <- c("Esp�rito Santo", "Minas Gerais",
       "S�o Paulo", "Rio de Janeiro")

sudeste %>% str_length()

sudeste %>% length()

### mai�sculas e min�sculas 

sudeste %>%str_to_lower() # todas min�sculas
sudeste %>%str_to_upper() # todas mai�sculas
sudeste %>%str_to_title() # s� a primeira mai�scula

### remover espa�os que "surgem" nos formul�rios 

flamenguista <- c("sim", "n�o ", " n�o", "sim") 


flamenguista %>% table()

flamenguista %>% str_trim() %>% table()

### voc� busca apenas um peda�o da string

nomes <- c( "01-Ana", "02-Jo�o", "03-Pedro" , "O4-Rafael")

nomes %>% str_sub(start = 4)

nomes %>% str_sub(end = 2)

nomes %>% str_sub(4,4) ## pode "cortar" antes e depois

### "juntar" os caracteres?

str_c(nomes," - ", sudeste ) ### vetor separador vetor

### projeto extremamente relevante 
# https://towardsdatascience.com/using-stringr-and-regex-to-extract-features-from-textual-alphanumeric-and-punctuation-data-in-r-2565256c0a77


### instalar o pacote
install.packages("titanic")
### chamar
library(titanic)
### criar o objeto
df = titanic_train 

### chamar a biblioteca
library(stringr)

### salvar nomes com letra min�scula
df$lcName = str_to_lower( df$Name )

### a estrat�gia

#                     (?<=\\s)[[:alpha:]]+(?=\\.)

## (?<=\\s) indica que o trecho procurado � precedido (?<=) por um espa�o em branco (\\s).
## [[:alpha:]]+ indica que o trecho procurado consiste em uma ou mais (+) letras ([[:alpha:]]).
## (?=\\.) indica que o texto procurado � precedido (? =) por um ponto (\\.).

### foco no https://www.devmedia.com.br/iniciando-expressoes-regulares/6557

df$title = str_extract( df$lcName, "(?<=\\s)[[:alpha:]]+(?=\\.)" )


### extrair o sobrenome

### incluir quaisquer tipos de caracteres (.) que tenham 1 
# caractere ou mais de comprimento (+) e sejam seguidos 
# por uma v�rgula (? = \\,)

df$family=str_extract(df$lcName,".+(?=,)")

t=data.frame(table(df$family))

head(t, 10)

### extrair informa��o do ticket

### colocar tudo em min�scula
df$lcTicket=str_to_lower(df$Ticket)

head(df$lcTicket,10)

### remover caracteres de pontua��o equivalente a [.,!?:...] 
df$lcTicket=str_replace_all(df$lcTicket,"[:punct:]","")

head(df$lcTicket,10)

### remover acr�nimo ou sigla
df$Ticketinfo = str_extract( df$lcTicket, ".+(?=\\s(?=[[:digit:]]{3,}))[[:alpha:]|]+" )

head(df$Ticketinfo,4)

### remover espa�os 
df$Ticketinfo = str_replace_all( df$Ticketinfo, "\\s", "" )

head(df$Ticketinfo,10)

### remover NA 
df$Ticketinfo = ifelse( is.na(df$Ticketinfo), "none", df$Ticketinfo )









