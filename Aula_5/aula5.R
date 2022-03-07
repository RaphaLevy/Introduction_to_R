# manipulação de dados - funções 
# Referências 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/entrada-dados.html
# https://rpubs.com/rcleoni/estdescritiva 


#### uma ideia ... Como forçar Factor ser
## ordinal?

# criar vetor
escolaridade <- c("Ensino Fundamental", "Ensino Fundamental", 
                 "Ensino Superior", "Ensino Médio", "Ensino Fundamental", 
                 "Ensino Superior", "Ensino Fundamental", "Ensino Médio")

escolaridade

# especificar os níveis 
escolaridade <- factor(escolaridade, order = TRUE, 
                                    levels = c("Ensino Fundamental", 
                                  "Ensino Médio",  "Ensino Superior"))

escolaridade

### criar tabela 

table(escolaridade)

prop.table(table(escolaridade))



#### excelente ferramenta e abordou de maneira razoável o Latin
library(readxl)


organicosxlsx <-read_excel("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdução a R/Organicos.xlsx", sheet=1, col_names=TRUE)

organicos <- subset(organicosxlsx, organicosxlsx[4] == "Sim")

organicos <- subset(organicosxlsx, organicosxlsx[5] == "Saúde")

str(organicos)

### vamos salvar como XLS? Cuidado com o SO 
install.packages("WriteXLS")

library(WriteXLS)


WriteXLS(organicos, "organicos.xls", SheetNames = "aulaR")

attach(organicos)

reg_tb <- table(Região)


####  no windows 

install.packages("writexl") 
library(writexl)
write_xlsx(organicos, "organicosteste.xls")

install.packages("xlsx")

library(xlsx)

write.xlsx(organicos, "organicos.xls")

dir()

### mais uma análise 

install.packages("coronavirus")
library(coronavirus)


data(coronavirus)

?coronavirus

str(coronavirus)

# Se quiser ver mais linhas ou menos linhas, faça assim: "head(    , 15)" ou "head(     , 3)".

head(coronavirus, 15)

# Ver as últimas linhas do arquivo A função "tail()"

tail(coronavirus, 5)


## dimensão linhas e colunas
dim(coronavirus)



### mediana? Primeiro temos que matar os NA's

median(coronavirus$cases, na.rm = T)


### média simples

mean(coronavirus$cases, na.rm = T)



### média com extração dos extremos 

mean(coronavirus$cases, trim = 0.1, na.rm = T)  ### tira 10% pra cima e 10% pra baixo dos dados


### variância 

var(coronavirus$cases, na.rm = T)


### desvio padrão

sd(coronavirus$cases, na.rm = T)


### grande indicador 

cv <-  sd(coronavirus$cases, na.rm = T)/ mean(coronavirus$cases, na.rm = T)


cv


### verificar o somatório de casos por região 

tapply(coronavirus$cases, coronavirus$combined_key, sum)


### Missão...

# Faça umas contas com uma planilha de "sua confiança". 

dados <-read_excel("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdução a R/aula5_dados.xlsx", sheet=1, col_names=TRUE)

cv <- function(coluna)
{
  result <- sd(coluna, na.rm = T)/mean(coluna, na.rm = T)
  return(result)
}

cv(dados$A)

cv(dados$B)
    