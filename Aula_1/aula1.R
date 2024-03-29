# o B�sico

# Feedback
# Casa de Ferreiro


# O R 

#Criada em 1993 por Ross Ihaka e Robert Gentleman no Departamento de 
#Estat�stica da Universidade de Auckland, Nova Zel�ndia.
# O R foi desenvolvido a partir da Linguagem S, criada na AT&T Bell 
#Labs por John Chambers, Rick Becker e Allan Wilks em 1976.

# Hoje � um monstro --- Deu for�a para o Monstro Hadley Wickham
# Leia uma entrevista com o mesmo https://ichi.pro/pt/dataviz-e-o-20-aniversario-de-r-uma-entrevista-com-hadley-wickham-257441689828490


# Refer�ncias

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://adv-r.had.co.nz  <-- para Hacker 

# R � melhor
# Excel � excelente, mas ...
# o seu pr�ximo empregador olhar� para seus conhecimentos em R

# Esse � o R Studio
# eu gosto muito do https://rstudio.cloud/

# para instalar
# https://cran.r-project.org/ <-- Primeiro passo
# https://rstudio.com/products/rstudio/download/ <-- RStudio
# Linux? Atualize pacotes, instale o R sudo apt -y install r-base
# depois baixe o RStudio e instale




#### Precisa de ajuda?  help ou ?

help(mean)

?mean


# onde aprender mais 
# https://pt.stackoverflow.com/
# https://twitter.com/rbloggersbr
# https://www.r-bloggers.com/tag/rblogs/

# Quer usar o R para c�lculos do dia a dia? 

# Opera��o	    S�mbolo
# Adi��o        	+
# Subtra��o       -
# Divis�o	        /
# Multiplica��o   	*
# Exponencia��o	  ^

4 + 5 

#colocar uma linha para rodar?  com o cursor na linha  Windows CTRL + Enter  
#                                                      Mac command + Enter 

4*5

4 ^ 2  # cuidado com o cincunflexo, pois se n�o apertar o 
       # backspace ele tende a n�o ir

#sim... voc� pode colocar coment�rio em qualquer lugar
# sim.. voc� deve colocar coment�rio em tudo, mas nunca colocamos :( 

4 / 7 # vamos falar de precis�o em breve 
      # cuidado com acentos, mesmo nos coment�rios - alguns podem abrir 
      # e ver uma penca de caracteres desnecess�rios 

# Como o padr�o.. { } e [ ] n�o servem. 
# utilize ( ) sem modera��o e n�o esque�a das prioridades

# assim

( 3 + 4 )/2 

# � diferente de 

3 + 4/ 2 


#######  Operadores de compara��o

#      Teste	            S�mbolo
#  Igualdade            	==
#  Diferen�a            	!=
#  Maior que            	>
#  Menor que            	<
#  Maior ou igual       	>=
#  Menor ou igual	        <=
#  E                    	&
#  OU                   	|  
#  N�O                  	!


10 == 10 

10 != 10 

5 > 4 

5 < 4 

(3> 1 ) & ( 5 > 2) 

# recordando ... 
# p  q    p & q 
# V  V      V
# V  F      F
# F  V      F 
# F  F      F 


(3 < 1 ) | ( 5 > 2)

# recordando ... 
# p  q    p | q 
# V  V      V
# V  F      V
# F  V      V 
# F  F      F 


# Criando objetos 

# SEMPRE utilize o <- o = tamb�m � v�lido, mas pode te quebrar. Principalmente
# quando recordamos do operador de compara��o == 

# atribuindo um n�mero 
a <- 4 

a # voc� pode chamar sempre que precisar

a + 10  

# atribuindo um texto

texto <- "R"

texto 


# cuidados na declara��o de vari�veis 
# Exemplos de nomes de objetos que produzem erros
2x <- 1
_x <- 1
&x <- 1

# Exemplos de nomes de objetos que n�o produzem erros imediatos
class <- 1
print <- 1

########### ideias extremamente importantes  ###################

# Use espa�os entre objetos, operadores e chamadas a fun��es

3+4 

3 + 4 


# Sempre que poss�vel, crie objetos apenas com letras min�sculas 
# R � case sensitive 
# ideia interessante � sempre antes de desligar criar um sum�rio com as
# vari�veis que declarou. Eu fa�o isso? N�o! Mas � fala de pai! 
# fa�a o que eu digo, mas n�o fa�a o que eu fa�o. 


teste  <- 13 

Teste  <- 26 


#Se precisar separar o nome de um objeto, use _ (underscore ou tra�o em baixo)

isso.vai.te.quebrar <- 0

isso_nao <- 10 

# no pr�ximo encontro vamos analisar outras "entidades"
# e um pouco mais de l�gica? 
 
### MISS�O: instalar e rodar este script. 

