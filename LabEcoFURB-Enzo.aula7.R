library(ggplot2)
library(WDI)
library(scales)

# DADOS EM PAINEL
dadosChangesinventories <- WDI(country = 'all', indicator = 'NE.GDI.STKB.CD')

# Corte Transversal (2023)
dadosChangesinventories2023 <- WDI(country = 'all', indicator = 'NE.GDI.STKB.CD', start = 2023, end = 2023)

# Série Temporal do Brasil
dadosChangesinventoriesbr <- WDI(country = 'BR', indicator = 'NE.GDI.STKB.CD')

# Criar uma coluna de destaque para o Brasil nos dados de painel
dadosChangesinventories$highlight <- ifelse(dadosChangesinventories$country == 'Brazil', 'Brazil', 'Other')
dadosChangesinventories2023$highlight <- ifelse(dadosChangesinventories2023$country == 'Brazil', 'Brazil', 'Other')
dadosChangesinventoriesbr$highlight <- 'Brazil'  # Brasil apenas nesse gráfico

# Gráfico 1: Mudanças nas Inventários - Todos os Países
grafpainel <- ggplot(data = dadosChangesinventories, 
                     mapping = aes(x = year, y = NE.GDI.STKB.CD, color = highlight)) +
  geom_line(alpha = 0.8, size = 1) +  # Linha com opacidade
  labs(title = "Mudanças nas Inventários (Changes in Inventories)", 
       x = "Ano", 
       y = "Changes in Inventories") +  # Eixos renomeados
  scale_color_manual(values = c("Brazil" = "red", "Other" = "grey")) +  # Brasil em vermelho e outros em cinza
  scale_y_continuous(labels = label_number(accuracy = 0.00001)) +  # Arredondar para no máximo 5 casas decimais
  theme_minimal(base_size = 14) + 
  theme(legend.position = "none",  # Remover legenda
        text = element_text(family = "Arial", color = "black"), 
        plot.title = element_text(hjust = 0.5, size = 18, face = "bold"), 
        axis.title = element_text(face = "bold"))

# Gráfico 2: Mudanças nas Inventários 2023
grafcorte <- ggplot(dadosChangesinventories2023, 
                    mapping = aes(x = year, y = NE.GDI.STKB.CD, color = highlight)) +
  geom_point(alpha = 0.8, size = 3) +  # Usar pontos
  labs(title = "Mudanças nas Inventários em 2023", 
       x = "Ano", 
       y = "Changes in Inventories 2023") +  # Eixo y modificado
  scale_color_manual(values = c("Brazil" = "red", "Other" = "grey")) +  # Brasil em vermelho e outros em cinza
  scale_y_continuous(labels = label_number(accuracy = 0.00001)) +  # Arredondar
  theme_minimal(base_size = 14) + 
  theme(legend.position = "none", 
        text = element_text(family = "Arial", color = "black"), 
        plot.title = element_text(hjust = 0.5, size = 18, face = "bold"), 
        axis.title = element_text(face = "bold"))

# Gráfico 3: Mudanças nas Inventários - Brasil
grafserie <- ggplot(dadosChangesinventoriesbr, 
                    mapping = aes(x = year, y = NE.GDI.STKB.CD)) +
  geom_line(color = 'red', size = 1.5) +  # Linha vermelha para o Brasil
  labs(title = "Mudanças nas Inventários - Brasil", 
       x = "Ano", 
       y = "Changes in Inventories Brazil") +  # Eixo y modificado
  scale_y_continuous(labels = label_number(accuracy = 0.00001)) +  # Arredondar
  theme_minimal(base_size = 14) + 
  theme(legend.position = "none", 
        text = element_text(family = "Arial", color = "black"), 
        plot.title = element_text(hjust = 0.5, size = 18, face = "bold"), 
        axis.title = element_text(face = "bold"))

# Exibir os gráficos
print(grafpainel)  # Gráfico com todos os países
print(grafcorte)   # Gráfico com os dados de 2023
print(grafserie)   # Gráfico com os dados do Brasil
