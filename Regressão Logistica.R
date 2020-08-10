require(tidyverse)
require(ISLR)

setwd('C:/Users/kevin/Documents/Projetos/tcc')

# Import das bases de treino 
appl_train = read_csv('Bases/application_train.csv')
# Import das bases de test 
appl_test  = read.csv('Bases/application_test.csv') 

# Extração dos nomes das variaveis
appl_train %>% colnames

### TARGET é a variavel de interesse nessa situação



# Verificação da quantidade de valores nulos por colunas 
NULOS = appl_train %>% sapply(function(x) sum(is.na(x))); NULOS

NULOS[NULOS > 5]
# É necessário o tratamento individual por variavel, pois precisamos saber se elas contem sentido de negócio ou não 



# Regressão Logistica 
glm(TARGET ~ . , data = appl_train, family = binomial)
