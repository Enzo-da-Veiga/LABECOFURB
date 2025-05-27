# Carregar pacotes necessários
library(GetBCBData)
library(tidyverse)
library(scales)

# Obter os dados (como já está definido no seu código)
my.id <- c(dps = 7610)
df.bcb <- gbcbd_get_series(id = my.id,
                           first.date = '1996-01-31',
                           last.date = '2012-12-01',
                           format.data = 'long',
                           use.memoise = TRUE,
                           cache.path = tempdir(),
                           do.parallel = FALSE)

# Criar o gráfico com customização do eixo X e Y
p <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "steelblue", size = 1.2) +
  labs(
    title = "Executivo - Gabinete do Min. Ext. Esportes",
    subtitle = paste0(min(df.bcb$ref.date), " a ", max(df.bcb$ref.date)),
    x = "Ano",
    y = "Despesas com pessoal da União (R$ mil)"
  ) +
  scale_x_date(
    breaks = as.Date(c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01", "2012-01-01")),
    date_labels = "%Y"
  ) +
  scale_y_continuous(
    breaks = seq(0, 100000, by = 20000),
    labels = label_comma(big.mark = ".", decimal.mark = ","),
    limits = c(0, 100000)
  ) +
  theme_light(base_size = 13)

# Exibir o gráfico
print(p)
