source("set_env.R")

library(adventdrob)

input <- advent_input(day = 3, year = 2022, parse = TRUE)
scoreboard <- data.frame(letter = c(letters, LETTERS), val = 1:52)


# 3.1

score <- NA

for (i in 1:nrow(input)){
  d <- as.vector(input$x[i])
  splt <- nchar(d)/2
  reg <- paste("(?<=.{", splt, "})", sep = "")
  bag <- strsplit(d, reg, perl = TRUE)[[1]]
  left <- unlist(strsplit(bag[1], split = ""))
  right <- unlist(strsplit(bag[2], split = ""))
  item <- left[left %in% right]
  score[i] <- scoreboard$val[scoreboard$letter == item] 
}

sum(score)

# 3.2

#testdata
# input <- data.frame(x = c("vJrwpWtwJgWrhcsFMMfFFhFp",
#                           "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
#                           "PmmdzqPrVvPwwTWBwg",
#                           "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
#                           "ttgJtRGJQctTZtZT",
#                           "CrZsJsPPZsGzwwsLwLmpwMDw"))

score <- NA

input$group <- as.numeric(cut(1:nrow(input), breaks = nrow(input)/3))


for (i in unique(input$group)){
  elves <- input$x[input$group == i]
  elf1 <- unlist(strsplit(elves[1], split = ""))
  elf2 <- unlist(strsplit(elves[2], split = ""))
  elf3 <- unlist(strsplit(elves[3], split = ""))
  
  item <- unique(elf1[elf1 %in% elf2 & elf1 %in% elf3])
  print(item)
  score[i] <- scoreboard$val[scoreboard$letter == item] 
}

sum(score)
