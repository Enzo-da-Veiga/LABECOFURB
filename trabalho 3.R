install.packages("gganimate")
install.packages("gifski")      # para renderizar o gif
install.packages("transformr")  # necessário para transições suaves

library(GetBCBData)
library(tidyverse)
library(scales)
library(gganimate)
library(gifski)
library(transformr)

# Buscar os dados
my.id <- c(dps = 7610)
df.bcb <- gbcbd_get_series(id = my.id,
                           first.date = '1996-01-31',
                           last.date = '2012-12-01',
                           format.data = 'long',
                           use.memoise = TRUE,
                           cache.path = tempdir(),
                           do.parallel = FALSE)

# Definir limites fixos para os eixos (baseado no máximo esperado)
limite_y <- ceiling(max(df.bcb$value) / 20000) * 20000

# Gráfico animado com linha se formando e eixos fixos
p_animado <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred", size = 1.5) +
  scale_x_date(
    date_labels = "%Y", 
    date_breaks = "4 years",
    limits = c(as.Date("1996-01-01"), as.Date("2012-12-31"))
  ) +
  scale_y_continuous(
    limits = c(0, limite_y),
    breaks = seq(0, limite_y, by = 20000),
    labels = label_comma(big.mark = ".", decimal.mark = ",")
  ) +
  labs(
    title = "Evolução das Despesas - Gabinete do Min. Ext. Esportes",
    subtitle = 'Ano: {frame_along}',
    x = "Ano",
    y = "Despesas com pessoal da União (R$ mil)"
  ) +
  theme_minimal(base_size = 13) +
  transition_reveal(ref.date)  +  # Faz a linha se formar progressivamente
  ease_aes('linear')

# Renderizar animação
animate(p_animado, width = 800, height = 500, duration = 12, fps = 20, renderer = gifski_renderer())

# Salvar GIF
anim_save("grafico_despesas_animado_linha_formando.gif")
