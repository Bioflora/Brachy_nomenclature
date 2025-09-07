# Install the libreries
> install.packages("ggplot2")
> install.packages("ggrepel")
> install.packages("dplyr")

library(ggplot2)
library(ggrepel)
library(dplyr)

# Upload the data

data <- read.table("BrachyDAFunctions.txt", header = TRUE, sep = "\t")

# Convert Group (sp) to factor
data$sp <- as.factor(data$sp)

# Calculate centroids of each group
centroids <- data %>%
  group_by(sp) %>%
  summarise(F1 = mean(F1), F2 = mean(F2))


# Generate the 2D DA plot (without 95% ellipses) 
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

# Save the 2D DA plot (without ellipses) as pdf file
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


# Generate the 2D DA plot (with 95% ellipses) 
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

# Save the 2D DA plot (with ellipses) as pdf file
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
