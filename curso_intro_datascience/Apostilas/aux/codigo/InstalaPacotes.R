1#########################################
### Instalando pacotes do R para o curso
#########################################

pacotes <- c('tidyverse', 'jsonlite', 'xtable', 'stargazer',
             'urca', 'forecast', 'zoo', 'vars', 'shiny')


for(pacote in pacotes){

  if (!requireNamespace(pacote)){
    install.packages(pacote)
  }
}

if (!requireNamespace("devtools")){
  install.packages("devtools")
}


devtools::install_github("INWTlab/ireports")
