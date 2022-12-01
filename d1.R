source("set_env.R")
library(tidyverse)
library(adventdrob)

input <- advent_input(1, 2022, parse = TRUE)


# David Robinson's solution https://twitter.com/drob/status/1598183577363320832?s=54&t=CYRJF96fXNDFceP0Xqt_eA
input %>% 
  mutate(group = cumsum(is.na(x))) %>% 
  count(group, wt = x) %>%
  arrange(desc(n)) %>% 
  head(3) %>% 
  summarize(sum(n))



# My not so elegant solution (:<  
limits <- c(0, (as.numeric(rownames(input)[is.na(input$x)])))

sums <- NA
for(i in 2:length(limits)-1){
  print(i)
  start <- limits[i]+1
  stop <- limits[i+1]-1
  sums[i] <- sum(input$x[start:stop]) 
}

# 1.1
sort(sums, decreasing = TRUE)[1]

# 1.2
sum(sort(sums, decreasing = TRUE)[1:3])
