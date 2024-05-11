
datos <- read.csv("https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day08-circular/paises-con-mas-aportes.csv", header = TRUE, stringsAsFactors = FALSE)
datos <- head(datos, 6)

# Crear un gráfico circular con etiquetas de valores
pie(datos$Documents, labels = paste(datos$Country, "\n", datos$Documents), main = "Top 6 países con más contribuciones a la IA en 2020", col = rainbow(length(datos$Documents)))

# Agregar leyenda
legend("topright", datos$Country, fill = rainbow(length(datos$Documents)), cex = 0.8)
