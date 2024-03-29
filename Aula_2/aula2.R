

# classes de objetos e um pouco mais de l�gica...  

# Refer�ncias 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/computacao-cientifica.html. 
# http://adv-r.had.co.nz  <-- para Hacker 
# http://curso-r.github.io/posts/aula02.html <-- excelente para o 
# http://www.estatisticacomr.uff.br/?p=209 <-- l�gica



# vamos aumentar a quantidade de dados nas atribui��es? 
# para tanto introduziremos a fun��o combine c 

exe <- c( 3 , 4 , 5 )

exe

# para saber a classe do n�mero precisa utilizar a fun��o class


class( exe )

# numeric aceita n�meros inteiros e decimais 

# se voc� inserir um n�mero em decimal todos ser�o considerados decimais

exe <- c( 3.1 , 4 , 5 )

exe

class( exe )

# voc� tamb�m pode inserir caracteres 

exe_carac <- c( "introdu��o" , "ao" , "R")

exe_carac

class( exe_carac )


#######  classe para vari�veis categ�ricas 

exe_cat <- factor( c("sim", "n�o", "sim", "sim", "n�o", "n�o" ))

exe_cat

table(exe_cat) ### tabela de frequ�ncias


class( exe_cat )

#######  cuidado com os espa�os 

exe_cat <- factor( c("sim ", "n�o", "sim", "sim", "n�o", "n�o" ))

exe_cat

length(exe_cat) # retorna o tamanho do vetor



#### Tarefa 

### 1. Guarde em um objeto chamado nome uma string 
# contendo o seu nome completo.
nome <- "Raphael Levy"
### 2. Guarde em um objeto chamado cidade o nome da 
# cidade onde voc� mora. Em seguida, guarde em um objeto
#chamado estado o nome do estado onde voc� mora. 
# Usando esses objetos, resolva os itens abaixo:
cidade <- "Rio de Janeiro"
estado <- "RJ"
# a. Utilize a fun��o nchar() para contar o n�mero 
# de caracteres em cada cada string.
nchar(nome)
# b. Interprete o resultado do seguinte c�digo:

paste(cidade, estado)

# c. Interprete o resultado do seguinte c�digo:

paste(cidade, estado, sep = " - ")
paste(cidade, estado, sep = " , ")

# d. Desafio. Como voc� reproduziria o
#mesmo resultado do item (b) sem utilizar o argumento sep?
paste( cidade, "-" , estado)
paste( cidade, "," , estado)
# e. Qual a diferen�a entre as fun��es paste() e paste0()?

paste0(cidade, estado)




### opera��o com vetores


u <- c(10,20,30)
v <- c(1,2,3)
z <- c(1,2,3,4)


###  Soma de vetores
u+v
u+z

### Subtra��o de vetores
u-v

### Multiplica��o de vetores
v*u
u*v

### Divis�o de vetores
u/v
v/u

#### Fun��es com vetores
### somar todos os elementos em um vetor num�rico

sum(u)
sum(v)

## Produto de elementos:

### M�ximo e M�nimo

max(v)

min(u)

###Vari�ncia

var(u)


### Desvio Padr�o

sd(v)


#######  classe matriz 

matriz <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3,  ncol = 2) 

matriz


matriz_a <- matrix( 
  seq(1, 100),  ### cria elementos de 1 at� 100, crescendo pelas colunas 
  ncol = 10,
  nrow = 10) 

matriz_a

### podemos criar uma matriz preenchendo primeiro as linhas 
# e depois as colunas. Para isso, 
# basta definirmos o argumento byrow = TRUE


matriz_b <- matrix( 
  seq(1, 100), 
  ncol = 10,
  nrow = 10,
  byrow = TRUE)

matriz_b

### cuidado com o R ... ele vai reaproveitar dados 

matriz_c <- matrix( 
  seq(1, 9), 
  ncol = 2,
  nrow = 5)

matriz_c

#### Opera��es com matrizes

matriz_a * 10

### somar todos os elementos

sum(matriz_a)

### transposta

t(matriz_a)

### calcular o determinante

det(matriz_a)


### retorna elementos da diagonal principal

diag(matriz_a)

###  soma das linhas da matriz

rowSums(matriz_a)


###  m�dia  das linhas da matriz

rowMeans(matriz_a)

### soma das colunas da matriz

colSums(matriz_a)

###  m�dia  das colunas da matriz

colMeans(matriz_a)


##### tarefa

# Crie as matrizes
 
# A = | 1  2  4  |  e B = | 3  5  7 |
#     | 3  -1 2  |        | 0  4  8 |
#     | 6  -2 3  |        | 5  5  1 |

matriz_A <- matrix(c(1, 3, 6, 2, -1, -2, 4, 2, 3), nrow = 3,  ncol = 3) 

matriz_A

matriz_B <- matrix(c(3, 0, 5, 5, 4, 5, 7, 8, 1), nrow = 3,  ncol = 3) 

matriz_B

# crie as matrizes A e B e realize as seguintes opera��es:
  
# a) A+B
# b) A-B
# c) A*B

matriz_A + matriz_B

matriz_A - matriz_B

matriz_A * matriz_B

#### cuidado com o *  n�o � produto matricial 
#### o que esperamos no padr�o � o %*%

matriz_A %*% matriz_B

matriz_A %% matriz_B


####### classe matriz -- criar um banco mais elaborado 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cec�lia" , "Diogo", "Heitor", "Jo�o"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)

resultado

dim(resultado) # retorna a dimens�o do objeto

nrow(resultado) # retorna o n�mero de linhas

ncol(resultado) # retorna o n�mero de colunas





# se mudar o n�mero de elementos em um vetor quebram tudo - teste 

resultado2 <- data.frame(
  numero_chamada = c(1,2,3,4,5),
  nomes = c("Cec�lia" , "Diogo", "Heitor", "Jo�o"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado2_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)

resultado2

# Para saber qual � o tipo de um objeto, utilizamos a fun��o typeof()

double <- c(1, 2.5, 4.5) 

typeof(double)


inteiros <- c(1L, 6L, 10L)
typeof(inteiros)

logico <- c(TRUE, FALSE, T, F)
typeof(logico)

caracter <- c("introdu��o", "ao R", "1")
typeof(caracter)



# quer testar se um objeto � de determinado tipo?
# is.integer(), is.double(), is.logical(), is.character() 

is.integer(inteiros)

is.integer(double)

is.double(inteiros)

is.double(double)


# o R sempre for�a para o tipo "mais flex�vel"

tipos <- c(1, "curso")

typeof(tipos)

tipos <- c(1, 3.5)

typeof(tipos)

tipos <- c(3.5, "curso")

typeof(tipos)

# acessar elementos em uma lista

exe

exe[2]

resultado

resultado[1,2]  # linha coluna



#### tarefa 

# Crie tr�s vetores e depois "una" os tr�s em um mesmo data frame. 
# por exemplo, �ltimas disciplinas cursadas, nome do professor, nota.

disciplina = c("C�lculo Complexo", "Curvas e Superf�cies", "Modelagem Estat�stica")
professor = c("Roger" , "Asla", "Claudio")
nota = c(10, 10, 10)

tarefa <- data.frame(
  disciplina,
  professor,
  nota
)

tarefa


resultado2

##### fique atento

#### NaN quer dizer Not a number, ele aparece quando o resultado
# de uma express�o matem�tica n�o est� definida.

#### NA significa Not Available e simboliza informa��o ausente/faltante.
# usamos NA principalmente para representar dados faltantes em bancos de dados.

#### NULL significa vazio, nada. Quando queremos que uma fun��o n�o 
# retorne nada, fazemos ela devolver NULL.

### Inf representa o infinito, como no limite de fun��es matem�ticas. 
# Valores muito grandes (10e+308) e 1/0 retornam Inf (com I mai�sculo).


#### Vamos sair do b�sico? 

######################################

#### Instalando Pacotes

# A principal fonte de pacotes R � o CRAN (The Comprehensive R Archive Network)
# Comunidade de desenvolvedores que mantem o R e os pacotes "oficiais".


install.packages("devtools")

#### chamando um pacote


library(devtools)

install_github("silvadenisson/electionsBR")


##### alguns usu�rios relataram problema com o install_github

### Tentem

install.packages("githubinstall")

#### chamando um pacote


library(githubinstall)

githubinstall("silvadenisson/electionsBR")




# importante pacote

install.packages("sos")



# chamando / abrindo o pacote 

library(sos)

library(brew)

# fun��o 

findFn('correl')


# para animar https://rstudio.com/resources/cheatsheets/

# Folhas de Truques (Cheat Sheet)


