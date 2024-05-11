
library(ggplot2)

# Leer los datos desde la URL
url <- "https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day13-Family/Family%20Guy%20Dataset.csv"
datos <- read.csv(url)


numericas <- datos[sapply(datos, is.numeric)]


# Calcular la matriz de correlación
matriz_cor <- cor(numericas)

# Crear el heatmap de la matriz de correlación con una paleta de colores verdes
ggplot(data = reshape2::melt(matriz_cor),
       aes(x = Var1, y = Var2, fill = value, label = round(value, 2))) +
  geom_tile(color = "white") +
  geom_text(size = 3, color = "black") +
  scale_fill_gradient2(low = "#1A422F", mid = "#7ACB6A", high = "#E9F6E2", midpoint = 0) +
  labs(title = "Matriz de correlación de variables de la serie Family Guy",
       x = "Variables", y = "Variables", fill = "Correlación") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
