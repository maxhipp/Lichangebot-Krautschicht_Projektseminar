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
    axis.text = element_text(colour = "black", face = "italic", family = "Times New Roman"),
    axis.title = element_text(colour = "black", family = "Times New Roman"),
    axis.ticks = element_line(colour = "black"),
    # legend at the bottom 6)
    legend.position = "bottom"
  )
}