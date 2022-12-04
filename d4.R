source("set_env.R")
library(adventdrob)

input <- advent_input(day = 4, year = 2022, parse = TRUE)

# test input
# input <- data.frame(x = c("2-4,6-8",
#                     "2-3,4-5",
#                     "5-7,7-9",
#                     "2-8,3-7",
#                     "6-6,4-6",
#                     "2-6,4-8"))

# 4.1
cnt <- 0
for(i in 1:nrow(input)){
  elf1 <- strsplit(input$x[i], split = ",")[[1]][1]
  elf2 <- strsplit(input$x[i], split = ",")[[1]][2]
  
  elf1_tasks <- as.numeric(strsplit(elf1, "-")[[1]][1]):as.numeric(strsplit(elf1, "-")[[1]][2])
  elf2_tasks <- as.numeric(strsplit(elf2, "-")[[1]][1]):as.numeric(strsplit(elf2, "-")[[1]][2])
  
  if(sum(elf1_tasks %in% elf2_tasks) == length(elf1_tasks) | sum(elf2_tasks %in% elf1_tasks) == length(elf2_tasks)){
    print("overlap")
    cnt <- cnt + 1}
  
}
cnt


#4.2
cnt <- 0
for(i in 1:nrow(input)){
  elf1 <- strsplit(input$x[i], split = ",")[[1]][1]
  elf2 <- strsplit(input$x[i], split = ",")[[1]][2]
  
  elf1_tasks <- as.numeric(strsplit(elf1, "-")[[1]][1]):as.numeric(strsplit(elf1, "-")[[1]][2])
  elf2_tasks <- as.numeric(strsplit(elf2, "-")[[1]][1]):as.numeric(strsplit(elf2, "-")[[1]][2])
  
  if(sum(elf1_tasks %in% elf2_tasks)){
    print("overlap")
    cnt <- cnt + 1}
  
}
cnt
