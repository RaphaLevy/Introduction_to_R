

# Exerc�cio 1
# Crie o Data.Frame abaixo, inverta o g�nero e crie uma nova coluna com o IMC
# Nome        Idade  Sexo  Altura  Massa
# Andr�        23     F     165    76
# Ant�nio      35     F     177    98
# Bernardo     38     F     181    83
# Bruna        24     M     154    48
# Camila       23     M     160    55
# Daniel       21     F     175    69 
# Wilson       65     F     183    99 





# Exerc�cio 2

# No dataframe resultado criar a coluna quanto falta.

### quanto falta? O estudante precisa alcan�ar 14 nas duas avalia��es. 
# Crie uma coluna indicando quanto o estudante deve tirar na segunda
# avalia��o. 


#manipula��o de dados

# Refer�ncias 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/entrada-dados.html
# https://rpubs.com/rcleoni/estdescritiva 

getwd()  #n diret�rio onde o R est� lendo

# RSTUDIO preferences - general - folder

setwd("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdu��o a R") # mudar o diret�rio
## no Mac... cuidado com este passo a passo

getwd()


### O m�todo mais comum de importa��o de dados para o 
### R, � utilizando a fun��o read.table()

dados <- read.table("dados_aula_4.csv", header = TRUE,
                    sep = ";", dec = ",")
## Argumentos:
  
##  "dados_aula_4.csv": nome do arquivo
##   header = TRUE: significa que a primeira linha do arquivo 
#  deve ser interpretada como os nomes das colunas
## sep = ";": o separador de colunas 
# (tamb�m pode ser ",", "\t" para tabula��o e "" para espa�os)
## dec = ",": o separador de decimais (tamb�m pode ser ".")




## o comando acima pode ser substitu�do por

dados_dois <- read.csv2("dados_aula_4.csv")

str(dados_dois)



file.info("dados_aula_4.csv")# mostra o tamanho do arquivo, data de cria��o, ...



dir()  # mostra todos os arquivos presentes em um diret�rio 

file.exists("dados_aula_4.csv") # retorna TRUE ou FALSE para a presen�a de um arquivo

# Removendo um objeto. Serve para coluna.. vetor..
 
rm(dados_dois)



## Vamos ler dados do Excel?
## Carrega o pacote
install.packages("gdata")


library(gdata)

## Leitura diretamente do Excel
dados.xls <- read.xls("dados_aula_4.xls", sheet = "Plan1",
                      header = TRUE, dec = ",")


#### leitura com pacote "mais espec�fico" e adequado ao Windows

install.packages("readxl")


library(readxl)

## Leitura diretamente do Excel
dados.xls <- read_excel("dados_aula_4.xls", sheet = "Plan1",
                       col_names=TRUE)

?read_excel
## Estrutura
str(dados.xls)

## listar o que j� possu�mos 

ls()


## Carregando dados j� dispon�veis no R
## O R j� possui alguns conjuntos de dados 

## base de dados mtcars
data(mtcars)

### e  o que tem nesta base? 

?mtcars

## Estrutura e visualiza��o do objeto
str(mtcars)

### A fun��o data() lista os conjutos de dados dispon�veis.

data()

data(package = .packages(all.available = TRUE))

#### outros pacotes... como utilizar 

install.packages("babynames")

library(babynames)

data("babynames")

str(babynames)

rm(babynames)

### e para salvar os dados?

### vamos voltar ao mtcars?

data("mtcars")

str(mtcars)


write.table(mtcars, file = "mtcars.csv")



ls()

### Por padr�o, o arquivo resultante tem colunas 
# separadas por espa�o, o separador de decimal � ponto,
# e os nomes das linhas s�o tamb�m inclu�dos 
# Quer alterar?


write.table(mtcars, file = "mtcarsdois.csv", row.names = TRUE,
            sep = ";", dec = ",")

write.table(mtcars, file = "mtcarstres.csv", row.names = FALSE,
            sep = ";", dec = ",")


#### argumentos
## mtcars : o nome do objeto a ser exportado (matriz ou data frame)
## "mtcars.csv": nome do arquivo a ser gerado. 
## row.names = FALSE: para eliminar o nome das linhas do objeto 
## sep = ";": o separador de colunas (tamb�m pode ser ",", "\t" para tabula��o
# e "" para espa�os)
## dec = ",": o separador de decimais (tamb�m pode ser ".")

### Miss�o... escolha um conjunto de dados legado, analise 
# a estrutura dos dados e salve  o resultado analisando a import�ncia
# dos argumentos

### Vamos animar mais?

### Ler url

lerurl <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/carData/TitanicSurvival.csv", header=TRUE)


# Instalando o pacote 'rio'
install.packages("rio", dependencies = TRUE)

# Carrega o pacote rio
library(rio)

library(githubinstall)

githubinstall("leeper/rio")

# Carrega um arquivo em .csv no diretorio corrente
###covid19 <- import(file = "covid19_brasil_io.csv")

# Carrega um arquivo em .txt no diretorio corrente
###covid19 <- import(file = "dados.txt")

# Carrega um arquivo em .dta (Stata) no diretorio corrente
###covid19 <- import(file = "dados.dta")

# Carrega um arquivo em .sav (SPSS) no diretorio corrente
###covid19 <- import(file = "dados.sav")

# leitura de tabelas

titanic <- import("https://vincentarelbundock.github.io/Rdatasets/csv/carData/TitanicSurvival.csv", header=TRUE)

# str Ver a estrutura do arquivo
str(titanic)

# A fun��o "summary()" � bastante interessante para usar com arquivos que tenham n�meros. 
# Ela re�ne informa��es b�sicas sobre a coluna, como valor m�nimo, valor m�ximo, m�dia, 
# mediana, primeiro quartil e terceiro quartil.

summary(titanic)

# Ver os nomes das colunas do arquivo A fun��o "colnames()" 

colnames(titanic) # vale o names() 


#  Verificar a classe de uma coluna  "typeof()"

typeof(titanic$sex)



# Renomear coluna do arquivo Tamb�m podemos usar a fun��o "colnames()"

colnames(titanic)[1] <- "name"

colnames(titanic)


# Ver as primeiras linhas do arquivo, por padr�o, a fun��o "head()"


head(titanic)


# Se quiser ver mais linhas ou menos linhas, fa�a assim: "head(    , 15)" ou "head(     , 3)".

head(titanic, 4)

# Ver as �ltimas linhas do arquivo � com a fun��o "tail()"

tail(titanic)

tail(titanic, 2)

# criar uma tabela com a frequ�ncia de uma das colunas

table(titanic$sex)

barplot(table(titanic$sex))

pie(table(titanic$sex))



### exemplo muito bom 

funcionarios <- read.table("milsa.txt", head = T)

funcionarios

str(funcionarios)


### vamos organizar estes dados?

funcionarios$civil <- factor(funcionarios$civil, label = c("solteiro", "casado"), levels = 1:2)
funcionarios$instrucao <- factor(funcionarios$instrucao, label = c("Ensino Fundamental", "Ensino Médio", "Superior"), lev = 1:3, ord= T)
funcionarios$regiao <- factor(funcionarios$regiao, label = c("capital", "interior", "outro"), lev = c(2, 1, 3))


### vamos analisar as linhas novamente?

head(funcionarios)


### quais s�o os nomes das colunas?

names(funcionarios)


### dimens�o do data.frame

dim(funcionarios)

### n�o aguenta mais escrever funcionarios? Vamos encurtar 
# a busca pelo elemento? CUIDADO!!!

attach(funcionarios)

filhos


### vamos fazer uma an�lise univariada? 

is.factor(civil)

civil.tabela <- table(civil)


civil.tabela  ### apenas a frequ�ncia 

prop.table(civil.tabela) ### frequ�ncia relativa


#### Vari�vel qualitativa ordinal 

instrucao

instrucao.tabela <- table(instrucao)
instrucao.tabela

barplot(instrucao.tabela)


#### Vari�vel quanti discreta

filhos

is.numeric(filhos)


filhos.table <- table(filhos)

filhos.table

plot(filhos.table)

filhos.tabelarelativa <- prop.table(filhos.table)

filhos.tabelarelativa

filhos.fac <- cumsum(filhos.tabelarelativa)

plot(filhos.fac)


### analise os argumentos.. e traga uma inova��o 
?plot

plot(filhos.fac, type = "S")


### uma estat�stica? 

names(filhos.table)[filhos.table == max(filhos.table)] #### moda 

### mediana? Primeiro temos que matar os NA's

 median(filhos, na.rm = T)


### m�dia simples

 mean(filhos, na.rm = T)



### m�dia com extra��o dos extremos 

 mean(filhos, trim = 0.1, na.rm = T)


### vari�ncia 

 var(filhos, na.rm = T)


### desvio padr�o

sd(filhos, na.rm = T)


### grande indicador 

cv <-  sd(filhos, na.rm = T)/ mean(filhos, na.rm = T)

cv

###### quantitativa cont�nua
salario

is.numeric(salario)

stem(salario) ### ramos e folhas

range(salario)

nclass.Sturges(salario) ### qual a lei de Sturges?

salario.table <- table(cut(salario, seq(3.5, 23.5, l = 8))) # aten��o ao l 

prop.table(salario.table)


### an�lise bivariada

### quali x quali

civ.gi.tb <- table(civil, instrucao)
prop.table(civ.gi.tb)

###  relativo por linha
prop.table(civ.gi.tb, margin = 1)


### relativo por coluna
prop.table(civ.gi.tb, margin = 2)

barplot(civ.gi.tb, legend = T)

barplot(civ.gi.tb, beside = T, legend = T)

#### quali x quanti

tapply(salario, instrucao, mean)

tapply(salario, instrucao, sd)


#### quanti x quanti

plot(ano, salario)

################################# Para animar
## https://education.rstudio.com/
## https://www.rstudio.com/solutions/r-and-python/
## 

