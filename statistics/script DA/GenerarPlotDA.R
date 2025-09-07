# Cargar librerías necesarias
library(ggplot2)
library(ggrepel)
library(dplyr)

# Leer los datos
setwd("C:/Users/migue/Downloads/PlotDA")
datos <- read.table("Datos.tsv", header = TRUE, sep = "\t")

# Convertir Grupo a factor para colorar en funcion de esto
datos$Grupo <- as.factor(datos$Grupo)

# Calcular centroides por grupo para añadirlos al plot
centroides <- datos %>%
  group_by(Grupo) %>%
  summarise(Funcion1 = mean(Funcion1), Funcion2 = mean(Funcion2))



# Crear el gráfico
ggplot(datos, aes(x = Funcion1, y = Funcion2, color = Grupo)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  stat_ellipse(level = 0.95) +
  geom_point(data = centroides, aes(x = Funcion1, y = Funcion2), shape = 4, size = 5, stroke = 1.5) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "Funciones discriminantes canónicas", x = "Función 1", y = "Función 2") +
  theme(legend.position = "right")

# Si está como queremos y lo queremos guardar en pdf
pdf("discriminante_plot.pdf", width = 8, height = 6)
ggplot(datos, aes(x = Funcion1, y = Funcion2, color = Grupo)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  stat_ellipse(level = 0.95) +
  geom_point(data = centroides, aes(x = Funcion1, y = Funcion2), shape = 4, size = 5, stroke = 1.5) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "Funciones discriminantes canónicas", x = "Función 1", y = "Función 2") +
  theme(legend.position = "right")
dev.off()
