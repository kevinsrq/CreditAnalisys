rm(list=ls())
require(tidyverse)
require(gamlss)

# Caminho da base enriquecida 
path = getwd()
path0 = path %>% str_replace('Notebooks', 'Processamento/base_tratada.csv') 

# Leitura da base enriquecida 
base = read.csv(path0, sep=',')

base = dplyr::select(base, -c(X, SAFRA, DTREF, DT_REF, SK_ID_CURR, SK_ID_BUREAU, CODE_GENDER, FLAG_MOBIL, CNT_FAM_MEMBERS))

# Primeira análise da regressão
regmodel = gamlss(TARGET ~ ., data=base, family = LO())
sumario = summary(regmodel)

# Caminho para salva a primeira análise
path0 = path %>% str_replace('Notebooks', 'Processamento/Quick and Dirty.csv')

# Salvar o resultados
sink(path0)
print(sumario)
sink()


