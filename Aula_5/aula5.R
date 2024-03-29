# manipula��o de dados - fun��es 
# Refer�ncias 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/entrada-dados.html
# https://rpubs.com/rcleoni/estdescritiva 


#### uma ideia ... Como for�ar Factor ser
## ordinal?

# criar vetor
escolaridade <- c("Ensino Fundamental", "Ensino Fundamental", 
                 "Ensino Superior", "Ensino M�dio", "Ensino Fundamental", 
                 "Ensino Superior", "Ensino Fundamental", "Ensino M�dio")

escolaridade

# especificar os n�veis 
escolaridade <- factor(escolaridade, order = TRUE, 
                                    levels = c("Ensino Fundamental", 
                                  "Ensino M�dio",  "Ensino Superior"))

escolaridade

### criar tabela 

table(escolaridade)

prop.table(table(escolaridade))



#### excelente ferramenta e abordou de maneira razo�vel o Latin
library(readxl)


organicosxlsx <-read_excel("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdu��o a R/Organicos.xlsx", sheet=1, col_names=TRUE)

organicos <- subset(organicosxlsx, organicosxlsx[4] == "Sim")

organicos <- subset(organicosxlsx, organicosxlsx[5] == "Sa�de")

str(organicos)

### vamos salvar como XLS? Cuidado com o SO 
install.packages("WriteXLS")

library(WriteXLS)


WriteXLS(organicos, "organicos.xls", SheetNames = "aulaR")

attach(organicos)

reg_tb <- table(Regi�o)


####  no windows 

install.packages("writexl") 
library(writexl)
write_xlsx(organicos, "organicosteste.xls")

install.packages("xlsx")

library(xlsx)

write.xlsx(organicos, "organicos.xls")

dir()

### mais uma an�lise 

install.packages("coronavirus")
library(coronavirus)


data(coronavirus)

?coronavirus

str(coronavirus)

# Se quiser ver mais linhas ou menos linhas, fa�a assim: "head(    , 15)" ou "head(     , 3)".

head(coronavirus, 15)

# Ver as �ltimas linhas do arquivo A fun��o "tail()"

tail(coronavirus, 5)


## dimens�o linhas e colunas
dim(coronavirus)



### mediana? Primeiro temos que matar os NA's

median(coronavirus$cases, na.rm = T)


### m�dia simples

mean(coronavirus$cases, na.rm = T)



### m�dia com extra��o dos extremos 

mean(coronavirus$cases, trim = 0.1, na.rm = T)  ### tira 10% pra cima e 10% pra baixo dos dados


### vari�ncia 

var(coronavirus$cases, na.rm = T)


### desvio padr�o

sd(coronavirus$cases, na.rm = T)


### grande indicador 

cv <-  sd(coronavirus$cases, na.rm = T)/ mean(coronavirus$cases, na.rm = T)


cv


### verificar o somat�rio de casos por regi�o 

tapply(coronavirus$cases, coronavirus$combined_key, sum)


### Miss�o...

# Fa�a umas contas com uma planilha de "sua confian�a". 

dados <-read_excel("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdu��o a R/aula5_dados.xlsx", sheet=1, col_names=TRUE)

cv <- function(coluna)
{
  result <- sd(coluna, na.rm = T)/mean(coluna, na.rm = T)
  return(result)
}

cv(dados$A)

cv(dados$B)
    