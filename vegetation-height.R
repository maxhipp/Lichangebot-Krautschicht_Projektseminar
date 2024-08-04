library(ggplot2)

#Farbpalette farbenblindgeeignet
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(vegetation.height_GT2, aes(x = Exposition , y=Vegetation.Height, colour = Exposition)) +
  geom_point(size=3, shape="diamond") +
  scale_colour_manual(values = c(cbPalette[3],cbPalette[7])) +
  labs (x="Position", y="FAPAR", color = "Exposition") +
  ggtitle("Vegetationshöhen auf Nord- und Südseite") +
  theme(plot.title = element_text(hjust=0.5, size = 18))+
  ggsave(r"(graphs\vegetation_heights-n-s.png)", width = 6, height = 4)
