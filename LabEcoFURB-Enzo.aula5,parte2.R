# WDI - WORLD DEVELOPMENT INDICATORS
# OS DADOS DO BANCO MUNDIAL SÃO ACESSADOS

#install.packages("WDI")
library(WDI) # SEMPRE CHAMAR PACOTE

# PROCURAM AS VIGNETTES
# PÁGINAS COM INSTRUÇÕES DOS PACOTES

# GDP (current US$)(NE.GDI.STKB.CD)
# PIB, PREÇOS CORRENTES EM DÓLAR NORTE-AMERICANO 
# CÓDIGO: NE.GDI.STKB.CD

# VAMOS PESQUISAR O TERMO 'GDP' NO WDI

varChangesinventories<- WDIsearch('gdp') #CRIAR OBJETO COM RES.

# BUSCAR OS DADOS COM CÓDIGO DO SITE

options(scipen = 999) # AJUSTA A NOT. CIENT.

dadosChangesinventories <- WDI(country = 'all',
                               indicator = 'NE.GDI.STKB.CD')

dadosChangesinventories2023 <- WDI(country = 'all',
                                   indicator = 'NE.GDI.STKB.CD',
                                   start = 2023, end = 2023)
