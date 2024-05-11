library(ggplot2)

# Leer los datos
datos_ventas <- read.csv("https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day05-diverging/ventas.csv", sep = ",", quote = "")
colnames(datos_ventas) <- c("fecha", "ventas", "objetivo_ventas")

# Convertir la columna de fecha a formato de fecha
datos_ventas$fecha <- as.Date(datos_ventas$fecha, format = "%Y-%m-%d")

# Crear el gráfico de líneas
ggplot(datos_ventas, aes(x = fecha, y = ventas, color = "Ventas reales")) +
  geom_line(size = 1.5) +
  geom_line(aes(y = objetivo_ventas, color = "Objetivo de ventas"), linetype = "dashed", size = 1) +
  labs(x = "Fecha",
       y = "Ventas",
       color = "Tipo") +
  ggtitle("Divergencia entre ventas reales y objetivo de ventas en el mes de mayo") +
  theme_minimal() +
  theme(legend.position = "top",
        plot.title = element_text(hjust = 0.5, face = "bold")) +
  scale_color_manual(values = c("blue", "red")) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d-%m")