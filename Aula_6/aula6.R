

#### fun��es? 

### Refer�ncias
# https://www.tutorialspoint.com/r/r_functions.htm



# https://www.datamentor.io/r-programming/function/
# https://analisereal.com/tag/introducao-a-analise-de-dados-com-o-r-2/
# https://renkun-ken.github.io/pipeR-tutorial/Getting-started/First-example.html

### criar uma fun��o exige quais passos?


# func_nome <- function (argumentos) {
#  comandos
# return(resultado) 
# }

# o comando return() encerra a fun��o e retorna seu argumento.
# o return() � opcional. Caso omitido, a fun��o retorna 
# o �ltimo objeto calculado.

### exemplo 

potencia <- function(x, y) {
  # o resultado dessa fun��o ser� x elevado � y
  result <- x^y
  print(paste(x,"elevado �", y, "� igual a ", result))
}

### e como devo "chamar" a fun��o? 
potencia(2,3)

potencia(x = 8, y = 2)

### ele entende as vari�veis declaradas
potencia(y = 2, x = 8)

potencia(2, x=8)


### modificando os argumentos
potencia <- function(x, y = 2 ) {
  # o resultado dessa fun��o ser� x elevado � y
  result <- x^y
  print(paste(x,"elevado �", y, "� igual a", result))
}

potencia(4)

potencia(4,3)


### utilizando o return
testar_sinal <- function(x) {
  if (x > 0) {
    result <- "Positivo"
  }
  else if (x < 0) {
    result <- "Negativo"
  }
  else {
    result <- "Zero"
  }
  return(result)
}

testar_sinal(-10)


### solu��o para grandes volumes de dados 

testar_sinal <- function(x) {
  if (x>0) {
    return("Positivo")
  }
  else if (x<0) {
    return("Negativo")
  }
  else {
    return("Zero")
  }
}

testar_sinal(-10)

### Qual das duas prefere? 

### o que acha de fazermos um la�o com for?


somar_vetor <- function(vetor) { 
  soma <- 0
  for (i in 1:length(vetor)) 
  {
    soma <- soma + vetor[i]
  }
  return(soma)
}
x <- c(1:50)


somar_vetor(x)
### teste sem iniciar com o soma <- 0 ver� que d� problema


#### la�os aninhados

somar_matriz <- function(matriz){
  soma <- 0
  for(i in seq_len(nrow(matriz))) {
    for(j in seq_len(ncol(matriz))) {
      soma <- soma + matriz[i,j]
    }
  }
  return(soma)
}

x <- matrix(1:15, 3, 5) ### (n�meros da matriz, linha, coluna)
x

somar_matriz(x)


### o que acha de fazermos um la�o com while

somar_vetor <- function(vetor) { 
  soma <- 0
  i <- 1 
  while (i <= length(vetor)) {
    soma <- soma + vetor[i]
    i <- i + 1
  }
  return(soma)
}
x <- c(1:10)

somar_vetor(x)



### repeat e break

somar_vetor <- function(vetor) { 
  soma <- 0
  i <- 1 
  repeat {
    soma <- soma + vetor[i]
    i <- i + 1
    if (i > length(vetor)) {
      break
    }
  }
  return(soma)
}
x <-  c(1:10)

somar_vetor(x)


### Miss�o aula passada




library("readxl")

dados <-read_excel("/Users/ilana/Documents/RAPHAEL/FGV/2022/2022.1/Introdu��o a R/aula5_dados.xlsx", sheet=1, col_names=TRUE)


cv <- function(coluna)
{
  nlinhas <- nrow(coluna)
  ncolunas <- ncol(coluna)
  
  for(i in 1:ncolunas){
    coluna[nlinhas+1, i] <- sd(coluna[[i]], na.rm = T)/ mean(coluna[[i]], na.rm = T)
  }
}

cv(dados)

dados

### miss�o

# Fa�a uma fun��o que recebe a m�dia final de um aluno 
# por par�metro e retorna o seu conceito, conforme a tabela abaixo:
  
##  Nota           Conceito
# de 0,0 a 4,9     D
# de 5,0 a 6,9     C
# de 7,0 a 8,9     B
# de 9,0 a 10,0    A

testar_nota <- function(x) {
  if (x>=0 & x<=4.9) {
    return("D")
  }
  else if (x>=5 & x<=6.9) {
    return("C")
  }
  else if (x>=7 & x<=8.9) {
    return("B")
  }
  else if (x>=9 & x<=10) {
    return("A")
  }
  else {
    return("Nota incompat�vel")
  }
}

testar_nota(1)

testar_nota(6)

testar_nota(8)

testar_nota(9.9)

testar_nota(-1)

testar_nota(12)


testar_nota2 <- function(x) {
  if (x>9) {
    return("A")
  }
  else if (x>7) {
    return("B")
  }
  else if (x>5) {
    return("C")
  }
  else if (x>0) {
    return("D")
  }
  else{
    return("Nota inv�lida")
  }
}

testar_nota2(0.1)

testar_nota2(12)


### Vamos de pacotes???

# Os princ�pios fundamentais do tidyverse s�o:
  
#####  Reutilizar estruturas de dados existentes.
#####  Organizar fun��es simples usando o pipe.
#####  Aderir � programa��o funcional -> c�digo como 
# uma sequ�ncia de fun��es e/ou passos, as quais 
# de maneira composta ir�o resolver meu problema
#####  Projetado para ser usado por seres humanos.


#### Uma base de dados � considerada "tidy" se
# Cada observa��o � uma linha do bd.
# Cada vari�vel � uma coluna do bd.
# Cada dado est� numa c�lula do bd.



#### A anatomia do tidyverse
        ###  tibble
# uma reimplementa��o do data.frame com muitas melhorias.
# m�todo print() enxuto.
# documenta��o: https://tibble.tidyverse.org/.
        ###  readr
# leitura de dados tabulares: csv, tsv, fwf.
# recursos que determinam tipo de vari�vel, por exemplo, datas.
# documenta��o: https://readr.tidyverse.org/.
        ###  tidyr
# suporte para cria��o de dados no formato tidy (tabular).
# cada vari�vel est� em uma coluna.
# cada observa��o (unidade amostral) � uma linha.
# cada valor � uma c�dula.
# documenta��o: https://tidyr.tidyverse.org/.
        ###  dplyr
# oferece uma gram�tica extensa pra manipula��o de dados.
# opera��es de split-apply-combine.
# documenta��o: https://dplyr.tidyverse.org/.
        ###  ggplot2
# cria��o de gr�ficos baseado no The Grammar of Graphics
# (WILKINSON et al., 2013).
# constru��o baseada em camadas.
# documenta��o: https://ggplot2.tidyverse.org/.
        ###  forcats
# para manipula��o de vari�veis categ�ricas/fatores.
# renomenar, reordenar, transformar, aglutinar.
# documenta��o: https://forcats.tidyverse.org/.
        ### stringr
# recursos coesos constru�dos para manipula��o de strings.
# documenta��o: https://stringr.tidyverse.org/.
        ### purrr
# recursos para programa��o funcional.
# fun��es que aplicam fun��es em lote varrendo objetos:
# vetores, listas, etc.
# documenta��o: https://purrr.tidyverse.org/.


# A ideia do operador %>% (pipe) 
# possui como padr�o o uso do valor resultante 
# da express�o do lado esquerdo como primeiro 
# argumento da fun��o do lado direito.

# Vamos calcular a raiz quadrada da soma dos valores de 1 a 4. Primeiro, sem o pipe.

x <- c(1, 2, 3, 4)
sqrt(sum(x))

# Agora com o pipe.

if(!require(tidyverse)){install.packages("tidyverse");require(tidyverse)}

tidyverse_packages()



library(magrittr)

x %>% sum() %>% sqrt()  ### encontrar�amos no magrittr

### exemplo trigonom�trico

pi %>% sin


pi %>% sin %>% cos

### comparando 

cos(sin(pi))


### exemplos "mais intensos"
data(mtcars)

# a fun��o sample()  vai escolher aleatoriamente 10 000 
# valores no mpg e o replace = TRUE indica que � com reposi��o
sample_mtcars <- sample(mtcars$mpg, 10000, replace = TRUE)

# a fun��o density() "suaviza" o histograma, capturando e 
# concentrando-se nos principais aspectos dos dados dispon�veis. 
density_mtcars <- density(sample_mtcars, bw = 0.8,kernel = "gaussian")

# "largura" ajustada pela fun��o
plot(density_mtcars, col = "red", main="density of mpg (bootstrap)")


### estilo for�a bruta

plot(density(sample(mtcars$mpg, size = 10000, replace = TRUE), bw = 0.8,
             kernel = "gaussian"), col = "red", main="density of mpg (bootstrap)")

## com o operador pipe 

mtcars$mpg %>%
  sample(size = 10000, replace = TRUE) %>%
  density(0.8, kernel = "gaussian") %>%
  plot(col = "red", main = "density of mpg (bootstrap)")



### um pacote para gr�ficos

# refer�ncias
# https://curso-r.github.io/ragmatic-book/visualizacao-de-dados.html#com-ggplot2

#####          ggplot2         #######

# O ggplot2 � um pacote do R voltado para a cria��o de gr�ficos 
# estat�sticos. Ele � baseado na Gram�tica dos Gr�ficos 
# (grammar of graphics, em ingl�s), criado por Leland Wilkinson,
# que � uma resposta para a pergunta: o que � um gr�fico estat�stico? 


# Um gr�fico estat�stico � um mapeamento dos dados a partir de 
# atributos est�ticos (cores, formas, tamanho) em formas geom�tricas
# (pontos, linhas, barras).

data("mtcars")

head(mtcars)

# No ggplot2, os gr�ficos s�o constru�dos camada por camada 
# (ou, layers, em ingl�s), sendo que a primeira delas � dada 
# pela fun��o ggplot. Cada camada representa um tipo de 
# mapeamento ou personaliza��o do gr�fico.


library(ggplot2)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point()

# a fun��o aes()- Aesthetics - descreve como as 
# vari�veis s�o mapeadas em aspectos visuais de 
# formas geom�tricas definidas pelos geoms.

ggplot(data = mtcars, aes(x = disp, y = mpg, colour = as.factor(am))) + 
  geom_point()

# am (tipo de transmiss�o) foi mapeada � cor dos pontos, 
# sendo que pontos vermelhos correspondem � transmiss�o 
# autom�tica (valor 0) e pontos azuis � transmiss�o manual (valor 1).


###  voc� pode mapear uma vari�vel cont�nua � cor dos pontos:

ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl)) + 
  geom_point()

#  cyl -- n�mero de cilindros

### voc� pode mapear o tamanho dos pontos � uma vari�vel de interesse:

ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) +
  geom_point()

#  wt --  Peso (1000 libras)

#### Geoms definem qual forma geom�trica 
# ser� utilizada para a visualiza��o dos dados 
# no gr�fico. Como j� vimos, a fun��o geom_point() 
# gera gr�ficos de dispers�o transformando pares (x,y) 
# em pontos. Veja a seguir outros geoms bastante utilizados:

# geom_line: para retas definidas por pares (x,y)
# geom_abline: para retas definidas por um intercepto e uma inclina��o
# geom_hline: para retas horizontais
# geom_boxplot: para boxplots
# geom_histogram: para histogramas
# geom_density: para densidades
# geom_area: para �reas
# geom_bar: para barras

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram()

ggplot(mtcars, aes(x = as.factor(cyl))) + 
  geom_bar()

### cores
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot(color = "red", fill = "pink")

### eixos

# alterar os labels dos eixos acrescentamos as fun��es xlab() ou ylab()
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por gal�o") +
  ylab("Frequ�ncia")

# alterar os limites dos gr�ficos usamos as fun��es xlim() e ylim()
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por gal�o") +
  ylab("Frequ�ncia") +
  xlim(c(0, 40)) +
  ylim(c(0,8))


### legendas

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cilindros")

# trocar a posi��o da legenda:

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cilindros") +
  theme(legend.position="top")

#  retirar a legenda:
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  guides(fill=FALSE)

#### facets  
# excelente ferramenta para compara��o

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) + 
  geom_point() + 
  facet_grid(am~.)

# colocar os graficos lado a lado 

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(.~am)







