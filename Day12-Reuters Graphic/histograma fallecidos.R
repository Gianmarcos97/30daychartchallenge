

url <- "https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day12-Reuters%20Graphic/data.csv"
datos <- read.csv2(url, sep=";", fileEncoding = "UTF-8")
datos <- datos[datos$EDAD_DECLARADA != "virológico", ]
unique(datos$EDAD_DECLARADA)

datos$EDAD_DECLARADA <- as.numeric(gsub('"', '', datos$EDAD_DECLARADA))

paleta <- c("#c7e9c0", "#a1d99b", "#74c476", "#31a354", "#006d2c")

# Crear el histograma con la paleta de colores
hist(datos$EDAD_DECLARADA, 
     main = "Fallecidos por Covid-19 en base a su Edad - Datos 2021-2023",
     xlab = "Edad",
     ylab = "Frecuencia",
     col = paleta)