source("set_env.R")
library(adventdrob)
library(tidyverse)

input <- advent_input(day = 5, year = 2022, parse = TRUE)

# David Robinson's tidyverse solution

# 5.1
moves <- input %>% 
  filter(str_detect(x, "move")) %>% 
  extract(x, 
          c("num", "from", "to"), "move (\\d+) from (\\d+) to (\\d+)",
          convert = TRUE)

input %>% 
  filter(!str_detect(x, "move")) %>% 
  grid_tidy(x) %>% 
  filter(str_detect(value, "[A-Z]")) %>% 
  arrange(desc(row)) %>% 
  mutate(crate = match(col, unique(sort(col)))) %>% 
  select(crate, value) %>% 
  group_by(crate) %>% 
  summarize(crates = list(value)) %>% 
  deframe()


for (i in 1:nrow(moves)) {
  r <- moves[i, ]
  to_move = rev(tail(crates[[r$from]], r$num))
  crates[[r$from]] <- head(crates[[r$from]], -r$num)
  crates[[r$to]] <- c(crates[[r$to]], to_move)
}

crates %>% 
  map_chr(last) %>% 
  paste(collapse = "")


# 5.2

for (i in 1:nrow(moves)) {
  r <- moves[i, ]
  to_move = tail(crates[[r$from]], r$num)
  crates[[r$from]] <- head(crates[[r$from]], -r$num)
  crates[[r$to]] <- c(crates[[r$to]], to_move)
}

crates %>% 
  map_chr(last) %>% 
  paste(collapse = "")

# my solution (still in progress)

# 5.1
input <- advent_input(day = 5, year = 2022, parse = TRUE)

# organise moves
recipes <- input[grep(input$x, pattern = "move"), ]

moves <- data.frame(num = rep(NA, nrow(recipes)), from = NA, to = NA)

for (i in 1:nrow(recipes)){
  recipe <- unlist(recipes[i, ])
  spltd <- strsplit(recipe, split = " ")
  
  moves$num[i] <- as.integer(spltd[[1]][2])
  moves$from[i] <- as.integer(spltd[[1]][4])
  moves$to[i] <- as.integer(spltd[[1]][6])
}


# organise warehouse TODODODODO
warehouse <- input[grep("\\[", input$x), ]



i = 1
for (i in 1:nrow(warehouse)){
  spot <- unlist(warehouse[i, ])
  spltd <- unlist(strsplit(spot, split = " "))
  spltd[nchar(spltd) != 0]
  
}

# move crates  
for (i in 1:nrow(moves)){
  
}
