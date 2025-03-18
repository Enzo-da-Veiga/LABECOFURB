# WDI - WORLD DEVELOPMENT INDICATORS
# OS DADOS DO BANCO MUNDIAL SÃO ACESSADOS

#install.packages("WDI")
library(WDI) # SEMPRE CHAMAR PACOTE

# PROCURAM AS VIGNETTES
# PÁGINAS COM INSTRUÇÕES DOS PACOTES

# GDP (current US$)(NY.GDP.MKTP.CD)
# PIB, PREÇOS CORRENTES EM DÓLAR NORTE-AMERICANO 
# CÓDIGO: NY.GDP.MKTP.CD

# VAMOS PESQUISAR O TERMO 'GDP' NO WDI

varpib <- WDIsearch('gdp') #CRIAR OBJETO COM RES.

# BUSCAR OS DADOS COM CÓDIGO DO SITE

options(scipen = 999) # AJUSTA A NOT. CIENT.

dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')

dadospib2023 <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD',
                start = 2023, end = 2023)
              





