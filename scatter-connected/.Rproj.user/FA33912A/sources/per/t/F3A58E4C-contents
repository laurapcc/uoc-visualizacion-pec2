library(ggplot2)
library(dplyr)
library(plotly)

data <- read.csv("Accidentes_victimas_Carr__CCAA_provincia_00-22.csv")

# Victimas mortales por año y provincia
data_mortal <- data %>%
  filter(Tipo =="Víctimas mortales") %>%
  select(year,provincia,numero)

# Victimas mortales totales por año
data_mortal_total <- data_mortal %>%
  group_by(year) %>%
  summarise(total=sum(numero))

# grafico de puntos conectado
scatter <- plot_ly(data_mortal_total, x=~year, y=~total, type='scatter',
                   mode='lines+markers', marker=list(size=10)) %>%
  add_text(text = ~total, hoverinfo = "text", textposition = "top", showlegend = FALSE) %>%
  layout(title = "Total de víctimas mortales por año",
         xaxis = list(title = "Año"),
         yaxis = list(title = "Número total de víctimas"),
        margin = list(l=50, r=50, b=50, t=50))

scatter
