source("set_env.R")
library(adventdrob)

input <- advent_input(day = 7, year = 2022, parse = TRUE)

input <- data.frame(x = c(
"$ cd /",
"$ ls",
"dir a",
"14848514 b.txt",
"8504156 c.dat",
"dir d",
"$ cd a",
"$ ls",
"dir e",
"29116 f",
"2557 g",
"62596 h.lst",
"$ cd e",
"$ ls",
"584 i",
"$ cd ..",
"$ cd ..",
"$ cd d",
"$ ls",
"4060174 j",
"8033020 d.log",
"5626152 d.ext",
"7214296 k"
))

folder_structure <- list()

for (i in 1:nrow(input)){
  com <- input$x[i]
}


