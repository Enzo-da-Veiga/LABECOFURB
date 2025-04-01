# API (PORTA/FORMA DE ACESSO REMOTO)
# ACESSAMOS OS DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (WDI)
# INDICADORES DE DESENVOLVIMENTO MUNDIAL

# PIB (PRODUTO INTERNO BRUTO)
# install.packages("WDI")

library(WDI) # CARREGAR BIBLIOTECA/PACOTE

options(scipen = 999) # REMOVER A NOT. CIENT.

# DADOS EM PAINEL
dadosChangesinventories <- WDI(country = 'all',
                indicator = 'NE.GDI.STKB.CD')

paises <- c('BR', 'US')
dadosChangesinventoriesbrus <- WDI(country = paises,
                    indicator = 'NE.GDI.STKB.CD')

dadosChangesinventories2023 <- WDI(country = 'all',
                    indicator = 'NE.GDI.STKB.CD',
                    start = 2023, end = 2023)

# SÉRIE TEMPORAL
dadosChangesinventoriesbr <- WDI(country = 'BR',
                  indicator = 'NE.GDI.STKB.CD')
# GRÁFICOS
# BIBLIOTECA ggplot2 (tidyverse)
# install.packages("tidyverse")
library(tidyverse)

## DADOS PAINEL

grafpainel <- ggplot(dadosChangesinventories,
                     mapping = aes(y = NE.GDI.STKB.CD,
                                   x = year)) +
  geom_point()
print(grafpainel)

# CORTE TRANSVERSAL

grafcorte <- ggplot(dadosChangesinventories2023,
                    mapping = aes(y = NE.GDI.STKB.CD,
                                  x = year)) +
  geom_point()
print(grafcorte)

# SERIE TEMPORAL 

grafserie <- ggplot(dadosChangesinventoriesbr,
                    mapping = aes(y = NE.GDI.STKB.CD,
                                  x = year)) +
  geom_line()
print(grafserie)

