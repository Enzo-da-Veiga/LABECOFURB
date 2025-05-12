#| label: grafserie
#| warning: false
#| echo: false

library(ggplot2)
library(scales)

# Gráfico de Dados de Série Temporal (Mudanças nos Inventários)
grafserie <- ggplot(dadosChangesinventoriesbr, 
                    mapping = aes(x = year, y = NE.GDI.STKB.CD)) +
  
  # 1️⃣ Preenchimento abaixo da linha do Brasil com vermelho claro, cobrindo a parte inferior
  geom_area(aes(y = pmin(NE.GDI.STKB.CD, 0)), fill = "lightcoral", alpha = 0.4) +  # Área vermelha abaixo da linha
  
  # 2️⃣ Linha principal do Brasil (vermelho escuro)
  geom_line(color = 'red', size = 1.5) +  
  
  # 3️⃣ Linha vertical no ano da pandemia (2020) e rótulo no centro do gráfico
  geom_vline(xintercept = 2020, linetype = "dashed", color = "black", size = 1) +
  annotate("text", x = 2020, y = 0, 
           label = "Início da pandemia (2020)", vjust = -0.5, size = 4, angle = 90, hjust = 0.5) + 
  
  # 4️⃣ Títulos e eixos
  labs(title = "Mudanças nos Inventários - Brasil", 
       x = "Ano", 
       y = "Mudanças nos Inventários (USD)") +  
  
  # Eixo Y com valores em bilhões, limitado a -30 bilhões
  scale_y_continuous(labels = label_number(scale = 1e-9, suffix = " Bilhões"),
                     limits = c(-30e9, max(dadosChangesinventoriesbr$NE.GDI.STKB.CD, na.rm = TRUE) + 5e9)) +  
  
  # Eixo X começando em 1980, com intervalo de 10 anos
  scale_x_continuous(breaks = seq(1980, max(dadosChangesinventoriesbr$year), by = 10)) +  
  
  # Tema e estilo
  theme_minimal(base_size = 14) + 
  theme(
    legend.position = "none", 
    text = element_text(family = "Arial", color = "black"), 
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),  
    axis.title = element_text(face = "bold"),  
    axis.text = element_text(size = 12),  
    axis.title.x = element_text(margin = margin(t = 10)),  
    axis.title.y = element_text(margin = margin(r = 10))   
  )

# Exibir o gráfico
print(grafserie)
