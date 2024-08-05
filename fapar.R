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

none_theme <- function() {
  theme(
    panel.background = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y =  element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_blank(),
    legend.position = "bottom"
  )
}

ggplot(FAPAR_GT2, aes(x = FAPAR , y=Stump, colour = ..level..)) +
  geom_density2d(show.legend = FALSE, bins = 20, size = 0.5) +
  scale_colour_gradient(low = cbPalette[3], high = cbPalette[5]) +
  labs (x="FAPAR", y="Stubbe") +
  ggtitle("FAPAR auf Nord- und Südseite GT2") +
  ps_theme()
ggsave(r"(graphs\fapar_gt2_density2d.png)", width = 6, height = 4)