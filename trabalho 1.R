# INSTALAR O PACOTE

# install.packages("GetBCBData")

# CARREGAR A BIBLIOTECA

library(GetBCBData)
library(tidyverse) # TAMBÉM É NECESSÁRIO

# INSTRUÇÕES DO PACOTE (VIGNETTE)
# https://cran.r-project.org/web/packages/GetBCBData/vignettes/GetBCBData-vignette.html

# OS CÓDIGOS DAS VARIÁVEIS VÊM DIRETO DA PLATAFORMA
# ACESSAR O SGS
# http://www.bcb.gov.br/?sgs


my.id <- c(dps=7610)

df.bcb <- gbcbd_get_series(id = my.id ,
                           first.date = '1996-01-31',
                           last.date = '2012-12-01',
                           format.data = 'long',
                           use.memoise = TRUE, 
                           cache.path = tempdir(), # use tempdir for cache folder
                           do.parallel = FALSE)

glimpse(df.bcb)

# GRÁFICO SIMPLES

p <- ggplot(df.bcb, aes(x = ref.date, y = value) ) +
  geom_line() + 
  labs(title = 'Executivo - Gabinete do Min. Ext. Esportes', 
       subtitle = paste0(min(df.bcb$ref.date), ' to ', max(df.bcb$ref.date)),
       x = '', y = 'Despesas com pessoal da União, 	u.m.c. (mil).') + 
  theme_light()

print(p)
