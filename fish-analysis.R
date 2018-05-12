fish_data = read.csv("Gaeta_etal_CLC_data_1.csv")
library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 200, "big", "small"))
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))
fish_data_cat_filter <- filter(fish_data_cat, scalelength > 1)
library(tidyverse)
ggplot(data = fish_data_cat_filter) + 
geom_point(mapping = aes(x = length, y = scalelength, color = lakeid))
#Plot histogram of scale length by fish categorical size
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(mapping= aes(x =  scalelength, fill = length_cat), geom ="bar", position = "stack", binwidth = NULL, bins = 80)
ggsave("scale_hist_by_length.jpg", plot = last_plot())