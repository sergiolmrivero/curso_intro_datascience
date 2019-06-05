library(jsonlite)
library(dplyr)
library(lubridate)

###################
# Para
###################

########################
########################
# Api do saldo de credito de pessoas fisicas para o Para
########################
########################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14015/dados?formato=json&amp","Saldo_OpCreditoPF_PA")
Saldo_OpCreditoPF_PA <- fromJSON("Saldo_OpCreditoPF_PA")

########################
########################
# Transformando a primeira coluna em data, a segunda em inteiro e 
# renomeando o nome da segunda coluna
########################
########################

Saldo_OpCreditoPF_PA$data <- as.Date(Saldo_OpCreditoPF_PA$data, "%d/%m/%Y")
Saldo_OpCreditoPF_PA$valor <- as.integer(Saldo_OpCreditoPF_PA$valor) 
Saldo_OpCreditoPF_PA <- rename(Saldo_OpCreditoPF_PA, Saldo_OpCreditoPF = valor)

########################
########################
# Api do saldo de credito de pessoas juridicas para o Para
########################
########################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14042/dados?formato=json&amp","Saldo_OpCreditoPJ_PA")
Saldo_OpCreditoPJ_PA <- fromJSON("Saldo_OpCreditoPJ_PA")

########################
########################
# Transformando a primeira coluna em data, a segunda em inteiro e 
# renomeando o nome da segunda coluna
########################
########################

Saldo_OpCreditoPJ_PA$data <- as.Date(Saldo_OpCreditoPJ_PA$data, "%d/%m/%Y")
Saldo_OpCreditoPJ_PA$valor <- as.integer(Saldo_OpCreditoPJ_PA$valor)
Saldo_OpCreditoPJ_PA <- rename(Saldo_OpCreditoPJ_PA, Saldo_OpCreditoPJ = valor)

########################
########################
# Api da porcentagem de inadimplencia de credito de pessoas fisicas 
# para o Para
########################
########################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15874/dados?formato=json&amp","Inad_OpCreditoPF_PA")
Inad_OpCreditoPF_PA <- fromJSON("Inad_OpCreditoPF_PA")

########################
########################
# Transformando a primeira coluna em data, a segunda em numerico e 
# renomeando o nome da segunda coluna
########################
########################

Inad_OpCreditoPF_PA$data <- as.Date(Inad_OpCreditoPF_PA$data, "%d/%m/%Y")
Inad_OpCreditoPF_PA$valor <- as.numeric(Inad_OpCreditoPF_PA$valor)
Inad_OpCreditoPF_PA <- rename(Inad_OpCreditoPF_PA, Inad_OpCreditoPF = valor)

########################
########################
# Api da porcentagem de inadimplencia de credito de pessoas juridicas
# para o Para
########################
########################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15906/dados?formato=json&amp","Inad_OpCreditoPJ_PA")
Inad_OpCreditoPJ_PA <- fromJSON("Inad_OpCreditoPJ_PA")

########################
########################
# Transformando a primeira coluna em data, a segunda em numerico e 
# renomeando o nome da segunda coluna
########################
########################

Inad_OpCreditoPJ_PA$data <- as.Date(Inad_OpCreditoPJ_PA$data, "%d/%m/%Y")
Inad_OpCreditoPJ_PA$valor <- as.numeric(Inad_OpCreditoPJ_PA$valor)
Inad_OpCreditoPJ_PA <- rename(Inad_OpCreditoPJ_PA, Inad_OpCreditoPJ = valor)


PA <- full_join(Saldo_OpCreditoPF_PA, Saldo_OpCreditoPJ_PA, by="data")
PA <- full_join(PA, Inad_OpCreditoPF_PA, by="data")
PA <- full_join(PA, Inad_OpCreditoPJ_PA, by="data")

#PA$Part_PF <- PA$Inad_OpCreditoPF/PA$Saldo_OpCreditoPF

###################
# Espírito Santo
###################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14009/dados?formato=json&amp","Saldo_OpCreditoPF_ES")
Saldo_OpCreditoPF_ES <- fromJSON("Saldo_OpCreditoPF_ES")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14036/dados?formato=json&amp","Saldo_OpCreditoPJ_ES")
Saldo_OpCreditoPJ_ES <- fromJSON("Saldo_OpCreditoPJ_ES")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15868/dados?formato=json&amp","Inad_OpCreditoPF_ES")
Inad_OpCreditoPF_ES <- fromJSON("Saldo_OpCreditoPF_ES")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15900/dados?formato=json&amp","Inad_OpCreditoPJ_ES")
Inad_OpCreditoPJ_ES <- fromJSON("Inad_OpCreditoPJ_ES")

ES <- full_join(Saldo_OpCreditoPF_ES, Saldo_OpCreditoPJ_ES)
ES <- full_join(ES, Inad_OpCreditoPF_ES)
ES <- full_join(ES, Inad_OpCreditoPJ_ES)

#####################
# Rio Grande do Sul
#####################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14022/dados?formato=json&amp","Saldo_OpCreditoPF_RS")
Saldo_OpCreditoPF_RS <- fromJSON("Saldo_OpCreditoPF_RS")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14049/dados?formato=json&amp","Saldo_OpCreditoPJ_RS")
Saldo_OpCreditoPJ_RS <- fromJSON("Saldo_OpCreditoPJ_RS")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15881/dados?formato=json&amp","Inad_OpCreditoPF_RS")
Inad_OpCreditoPF_RS <- fromJSON("Saldo_OpCreditoPF_RS")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15913/dados?formato=json&amp","Inad_OpCreditoPJ_RS")
Inad_OpCreditoPJ_RS <- fromJSON("Inad_OpCreditoPJ_RS")

RS <- full_join(Saldo_OpCreditoPF_RS, Saldo_OpCreditoPJ_RS)
RS <- full_join(RS, Inad_OpCreditoPF_RS)
RS <- full_join(RS, Inad_OpCreditoPJ_RS)

################
# Brasília
################

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14008/dados?formato=json&amp","Saldo_OpCreditoPF_DF")
Saldo_OpCreditoPF_DF <- fromJSON("Saldo_OpCreditoPF_DF")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14035/dados?formato=json&amp","Saldo_OpCreditoPJ_DF")
Saldo_OpCreditoPJ_DF <- fromJSON("Saldo_OpCreditoPJ_DF")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15867/dados?formato=json&amp","Inad_OpCreditoPF_DF")
Inad_OpCreditoPF_DF <- fromJSON("Saldo_OpCreditoPF_DF")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15869/dados?formato=json&amp","Inad_OpCreditoPJ_DF")
Inad_OpCreditoPJ_DF <- fromJSON("Inad_OpCreditoPJ_DF")

DF <- full_join(Saldo_OpCreditoPF_DF, Saldo_OpCreditoPJ_DF)
DF <- full_join(DF, Inad_OpCreditoPF_DF)
DF <- full_join(DF, Inad_OpCreditoPJ_DF)

##############
# Sergipe
##############


download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14027/dados?formato=json&amp","Saldo_OpCreditoPF_SE")
Saldo_OpCreditoPF_SE <- fromJSON("Saldo_OpCreditoPF_SE")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.14054/dados?formato=json&amp","Saldo_OpCreditoPJ_SE")
Saldo_OpCreditoPJ_SE <- fromJSON("Saldo_OpCreditoPJ_SE")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15886/dados?formato=json&amp","Inad_OpCreditoPF_SE")
Inad_OpCreditoPF_SE <- fromJSON("Saldo_OpCreditoPF_SE")

download.file("http://api.bcb.gov.br/dados/serie/bcdata.sgs.15918/dados?formato=json&amp","Inad_OpCreditoPJ_SE")
Inad_OpCreditoPJ_SE <- fromJSON("Inad_OpCreditoPJ_SE")

SE <- full_join(Saldo_OpCreditoPF_SE, Saldo_OpCreditoPJ_SE)
SE <- full_join(SE, Inad_OpCreditoPF_SE)
SE <- full_join(SE, Inad_OpCreditoPJ_SE)