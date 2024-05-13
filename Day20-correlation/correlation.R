library(ggplot2)
library(readr)
library(lubridate)
library(dplyr)
library(stringr)
# Definir la URL del archivo CSV
url <- "https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day20-correlation/ventas_juguetes.csv"

# Leer el archivo CSV desde la URL
ventas <- read_csv(url)

# Convertir la columna 'Fecha' a formato de fecha
ventas$Fecha <- as.Date(ventas$Fecha)

# Agrupar los datos por semana y calcular la media de las ventas
ventas_semana <- ventas %>%
  mutate(Semana = floor_date(Fecha, "week")) %>%
  group_by(Semana) %>%
  summarise(Barbie = mean(Barbie),
            LEGO = mean(LEGO))

# Filtrar para incluir solo las últimas 4 semanas
ventas_semana <- ventas_semana %>%
  filter(Semana >= tail(unique(Semana), 4)[1])

# Calcular la correlación entre las ventas de Barbie y LEGO
correlacion <- cor(ventas_semana$Barbie, ventas_semana$LEGO)

# Crear la gráfica de líneas
ggplot(ventas_semana, aes(x = Semana)) +
  geom_line(aes(y = Barbie, color = "Muñecas Barbie")) +
  geom_line(aes(y = LEGO, color = "Sets de Construcción LEGO")) +
  labs(title = paste("Correlación de Ventas Semanales de Juguetes en enero 2023 \nCorrelación:", round(correlacion, 2)),
       x = "Semana",
       y = "Ventas",
       color = "Producto") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))