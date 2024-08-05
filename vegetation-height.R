library(ggplot2)
library(extrafont)
loadfonts(device = "win")

#Farbpalette farbenblindgeeignet
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ps_theme <- function() {
  theme(
    panel.background = element_rect(fill = "white"),
    panel.grid.major.x = element_line(colour = "black", linetype = 3, size = 0.5),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y =  element_line(colour = "black", linetype = 3, size = 0.5),
    panel.grid.minor.y = element_blank(),
    axis.text = element_text(colour = "black", face = "italic", size = 10),
    axis.title = element_text(colour = "black", face = "bold", size = 12),
    axis.ticks = element_line(colour = "black"),
    plot.title = element_text(hjust=0.5, face = "bold", size = 18),
    legend.position = "bottom"
  )
}

ggplot(vegetation.height_GT2, aes(x = Exposition , y=Vegetation.Height, fill = Exposition)) +
  geom_point(size=5, shape=23, show.legend = FALSE) +
  scale_fill_manual(values = c(cbPalette[3],cbPalette[7])) +
  labs (x="Exposition", y="FAPAR") +
  ggtitle("Vegetationshöhen auf Nord- und Südseite") +
  ps_theme()
ggsave(r"(graphs\vegetation_heights-n-s.png)", width = 6, height = 4)

ggplot(vegetation.height_GT2, aes(x = Exposition , y=Vegetation.Height, fill = Exposition)) +
  geom_boxplot(width = 0.35, size = 0.75, show.legend = FALSE, outlier.colour="black") +
  scale_fill_manual(values = c(cbPalette[3],cbPalette[7])) +
  labs (x="Exposition", y="Vegetationshöhe" ) +
  ggtitle("Vegetationshöhen") +
  ps_theme()
ggsave(r"(graphs\vegetation_heights-n-s_boxplot.png)", width = 6, height = 4)
