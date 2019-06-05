### Lendo o Arquivo CSV do PIB

PIB9616 <- read.csv(file = '../Dados/PIB_BR_1996-2016.csv', fileEncoding = "UTF-8")


### Salvando o Dataframe do PIB

save(PIB9616, file='../Dados/PIB9616.Rda')

