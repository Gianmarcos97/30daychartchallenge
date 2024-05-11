url2 <- "https://raw.githubusercontent.com/Gianmarcos97/30daychartchallenge/main/Day11-mobile-friendly/data.csv"
datos3 <- read.csv(url2,sep = ",")
datos3 <- unique(datos3)
datos3$Price.... <-  as.integer(gsub("[\\$|,]", "", datos3$Price....)) 
datos3 <- datos3[!is.na(datos3$Price....), ]


hist(datos3$Price...., main = "Histograma de Precio de celulares en dólar - 2023", xlab = "Precio", ylab = "Frecuencia", col = "skyblue")