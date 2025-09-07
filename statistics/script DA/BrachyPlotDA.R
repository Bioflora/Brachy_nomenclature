# Cargar librerías necesarias
> install.packages("ggplot2")
> install.packages("ggrepel")
> install.packages("dplyr")

library(ggplot2)
library(ggrepel)
library(dplyr)

# Leer los datos
setwdsetwd("C:/Users/usuario/Desktop/Brachypodium_nomenclature/Brachy_nomenclature_ms/DA morphological data marzo_mayo2025/script DA")
data <- read.table("DAFunctions.txt", header = TRUE, sep = "\t")

# Convertir Grupo (sp) a factor para colorear en funcion de esto
data$sp <- as.factor(data$sp)

# Calcular centroides por grupo para añadirlos al plot
centroids <- data %>%
  group_by(sp) %>%
  summarise(F1 = mean(F1), F2 = mean(F2))


# Crear el gráfico sin elipses 95%
ggplot(data, aes(x = F1, y = F2, color = sp)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  geom_point(data = centroids, aes(x = F1, y = F2), shape = 4, size = 5, stroke = 1.5) +
  scale_color_manual(values = c("1" = "blue", "2" = "red", "3" = "magenta")) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "DA Functions", x = "F1", y = "F2") +
  theme(legend.position = "right")

# Si está como queremos y lo queremos guardar en pdf
pdf("DA_plot without ellipses.pdf", width = 8, height = 6)
ggplot(data, aes(x = F1, y = F2, color = sp)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  geom_point(data = centroids, aes(x = F1, y = F2), shape = 4, size = 5, stroke = 1.5) +
  scale_color_manual(values = c("1" = "blue", "2" = "red", "3" = "magenta")) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "DA Functions", x = "F1", y = "F2") +
  theme(legend.position = "right")
dev.off()


# Crear el gráfico con elipses 95%
ggplot(data, aes(x = F1, y = F2, color = sp)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  stat_ellipse(level = 0.95) +
  geom_point(data = centroids, aes(x = F1, y = F2), shape = 4, size = 5, stroke = 1.5) +
  scale_color_manual(values = c("1" = "blue", "2" = "red", "3" = "magenta")) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "DA Functions", x = "F1", y = "F2") +
  theme(legend.position = "right")

# Si está como queremos y lo queremos guardar en pdf
pdf("DA_plot with ellipses.pdf", width = 8, height = 6)
ggplot(data, aes(x = F1, y = F2, color = sp)) +
  geom_point(size = 3) +
  geom_text_repel(aes(label = ID), size = 3, color = "black", max.overlaps = Inf) +
  stat_ellipse(level = 0.95) +
  geom_point(data = centroids, aes(x = F1, y = F2), shape = 4, size = 5, stroke = 1.5) +
  scale_color_manual(values = c("1" = "blue", "2" = "red", "3" = "magenta")) +
  scale_x_continuous(limits = c(-7, 7), breaks = -7:7) +
  scale_y_continuous(limits = c(-7, 7), breaks = -7:7) +
  theme_minimal() +
  labs(title = "DA Functions", x = "F1", y = "F2") +
  theme(legend.position = "right")
dev.off()
