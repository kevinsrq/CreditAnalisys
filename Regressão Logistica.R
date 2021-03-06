require(tidyverse)
require(ISLR)

setwd('C:/Users/kevin/Documents/Projetos/tcc')

# Import das bases de treino 
appl_train = read_csv('Bases/application_train.csv')
# Import das bases de test 
appl_test  = read.csv('Bases/application_test.csv') 

# Extra��o dos nomes das variaveis
appl_train %>% colnames

### TARGET � a variavel de interesse nessa situa��o



# Verifica��o da quantidade de valores nulos por colunas 
NULOS = appl_train %>% sapply(function(x) sum(is.na(x))); NULOS

NULOS[NULOS > 5]
# � necess�rio o tratamento individual por variavel, pois precisamos saber se elas contem sentido de neg�cio ou n�o 



# Regress�o Logistica 
glm(TARGET ~ . , data = appl_train, family = binomial)
