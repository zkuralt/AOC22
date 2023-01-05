library(raster)
library(rasterVis)
source("set_env.R")
library(adventdrob)
library(rayshader)
library(ggplot2)
library(tidyverse)

input <- advent_input(day = 8, year = 2022, parse = TRUE)

d <- as.integer(unlist(strsplit(input$x, "")))

# let's visualize our data
ras <- raster::raster(matrix(data = d, ncol = length(input$x), byrow = TRUE))
plot(ras)
plot3D(ras)

data <- as.data.frame(ras, xy=TRUE)

pp_nolines = ggplot(data, aes(x=x, y=y)) +
  geom_raster(aes(fill = layer)) +
  scale_fill_viridis_c(option = "C")
plot_gg(pp_nolines, width = 4, height = 4, scale = 300, multicore = TRUE)




highest_yet <- function(x) x > lag(cummax(x), default = -1)

g <- input %>% 
  grid_tidy(x)

g %>% 
  group_by(row) %>% 
  mutate(from_left = highest_yet(value),
         from_right = rev(highest_yet(rev(value)))) %>% 
  group_by(col) %>% 
  mutate(from_top = highest_yet(value),
         from_bottom = rev(highest_yet(rev(value)))) %>% 
  filter(from_left | from_right | from_top | from_bottom)

scores <- g %>% 
  crossing(g %>% rename_all(paste0, "2")) %>% 
  filter(value2 >= value,
         (row != row2 | col != col2)) %>% 
  mutate(row_dist = row2 - row,
         col_dist = col2 - col) %>% 
  group_by(row, col, value)
