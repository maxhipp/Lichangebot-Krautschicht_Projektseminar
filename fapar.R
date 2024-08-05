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

ggplot(FAPAR_GT2, aes(x = FAPAR , y=Stump, colour = ..level..)) +
  geom_density2d(show.legend = FALSE, bins = 20, size = 0.5) +
  scale_colour_gradient(low = cbPalette[3], high = cbPalette[5]) +
  labs (x="FAPAR", y="Stubbe") +
  ggtitle("FAPAR-Werte GT2") +
  ps_theme()
ggsave(r"(graphs\fapar_gt2_density2d.png)", width = 6, height = 5)

FAPAR_GT2_mean <- aggregate(FAPAR_GT2$FAPAR, list(FAPAR_GT2$Stump, FAPAR_GT2$Exposition), FUN=mean)
colnames(FAPAR_GT2_mean) <- c("Stump","Exposition","FAPAR_mean")
FAPAR_GT2_mean_N <- FAPAR_GT2_mean[FAPAR_GT2_mean$Exposition == "N",]
FAPAR_GT2_mean_S <- FAPAR_GT2_mean[FAPAR_GT2_mean$Exposition == "S",]


ggplot() +
  geom_point(data = FAPAR_GT2, aes(x = Stump , y = FAPAR, fill = Exposition), shape = 21, size = 2, alpha = 0.5) +
  scale_fill_manual(values = c(cbPalette[3],cbPalette[7])) +
  scale_color_manual(values = c(cbPalette[3],cbPalette[7])) +
  labs (x="Stubbe", y="FAPAR") +
  ggtitle("FAPAR-Werte GT2") +
  ps_theme()+
  geom_point(data = FAPAR_GT2_mean, aes(x = Stump, y = FAPAR_mean, fill = Exposition), shape = 23, size=5, stroke = 1)+
  geom_hline(yintercept = mean(FAPAR_GT2_mean_N$FAPAR, na.rm=TRUE), color = cbPalette[3], size = 1)+
  geom_hline(yintercept = mean(FAPAR_GT2_mean_S$FAPAR, na.rm=TRUE), color = cbPalette[7], size = 1)
ggsave(r"(graphs\fapar_gt2_stumps_n-s.png)", width = 10, height = 5)

ggplot() +
  geom_violin(data = FAPAR_GT2, aes(x = Exposition , y = FAPAR, fill = Exposition), alpha = 0.75) +
  scale_fill_manual(values = c(cbPalette[3],cbPalette[7])) +
  scale_color_manual(values = c(cbPalette[3],cbPalette[7])) +
  labs (x="Exposition", y="FAPAR") +
  ggtitle("FAPAR-Werte GT2") +
  ps_theme()+
  geom_point(data = FAPAR_GT2_mean, aes(x = Exposition, y = FAPAR_mean), shape = 4, size=2, stroke = 1, alpha = 0.5)+
  geom_hline(yintercept = mean(FAPAR_GT2_mean_N$FAPAR, na.rm=TRUE), color = cbPalette[3], size = 1)+
  geom_hline(yintercept = mean(FAPAR_GT2_mean_S$FAPAR, na.rm=TRUE), color = cbPalette[7], size = 1)
ggsave(r"(graphs\fapar_gt2_n-s.png)", width = 6, height = 5)