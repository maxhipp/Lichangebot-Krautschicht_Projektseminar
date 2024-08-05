#Basis-Theme

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