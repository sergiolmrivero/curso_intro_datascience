library(ggplot2)
library(ggthemes)
library(forecast)

ggthemes::theme_economist()

setwd('/home/rivero/Dropbox/Workspace_Current/Projects/EmExec/Banpara/Cursos/git_curso/curso_intro_datascience/Apostilas/aux/Exemplos')
data <- read.csv2('../Dados/data.csv', header=T, sep=';', dec=',')
data$date <- as.Date(data$date, format='%d/%m/%Y')

tail(data)

ggplot(data, aes(date, previdencia/1000))+geom_line(size=.8)+
  xlab('')+ylab('R$ bilhoes')+
  labs(title='Despesa com Beneficios Previdenciarios')

data$prevreal <- data[,3]*(tail(data[,2],1)/data[,2]) 

ggplot(data, aes(date, previdencia/1000))+
  geom_line(size=.8, aes(color='Serie Nominal'))+
  geom_line(size=.8, aes(date, prevreal/1000, color='Serie Real'))+
  xlab('')+ylab('R$ bilhoes')+
  labs(title='Despesa com Beneficios Previdenciarios',
       colour='',
       caption='analisemacro.com.br')+
  theme(legend.position="top")

data.ts <- ts(data[,-1], start=c(1997,01), freq=12)

#cmav(data.ts[,2], ma=12)
