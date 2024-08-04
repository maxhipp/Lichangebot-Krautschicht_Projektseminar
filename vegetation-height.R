library(ggplot2)

#Farbpalette farbenblindgeeignet
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ps_theme <- function() {
  theme(
    # color background 2)
    panel.background = element_rect(fill = "white"),
    # modify grid 3)
    panel.grid.major.x = element_line(colour = "black", linetype = 3, size = 0.5),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y =  element_line(colour = "black", linetype = 3, size = 0.5),
    panel.grid.minor.y = element_blank(),
    # modify text, axis and colour 4) and 5)
    axis.text = element_text(colour = "black", face = "italic"),
    axis.title = element_text(colour = "black"),
    axis.ticks = element_line(colour = "black"),
    # legend at the bottom 6)
    legend.position = "bottom"
  )
}

ggplot(vegetation.height_GT2, aes(x = Exposition , y=Vegetation.Height, colour = Exposition)) +
  geom_point(size=4, shape="diamond") +
  scale_colour_manual(values = c(cbPalette[3],cbPalette[7])) +
  #labs (x="Exposition", y="FAPAR") +
  ggtitle("Vegetationshöhen auf Nord- und Südseite") +
  ps_theme()+
  theme(plot.title = element_text(hjust=0.5, size = 18))
ggsave(r"(graphs\vegetation_heights-n-s.png)", width = 6, height = 4)

ggplot(vegetation.height_GT2, aes(x = Exposition , y=Vegetation.Height, colour = Exposition)) +
  geom_boxplot(width = 0.35, show.legend = 'false') +
  scale_colour_manual(values = c(cbPalette[3],cbPalette[7])) +
  #labs (x="Exposition", y="FAPAR") +
  ggtitle("Vegetationshöhen") +
  ps_theme()+
  theme(plot.title = element_text(hjust=0.5, size = 18))
ggsave(r"(graphs\vegetation_heights-n-s_boxplot.png)", width = 6, height = 4)
