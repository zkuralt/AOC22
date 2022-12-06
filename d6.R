source("set_env.R")
library(adventdrob)

input <- unlist(advent_input(day = 6, year = 2022, parse = TRUE))

# 6.1
cnt <- 3

for(i in 4:nchar(input)){
  cnt <- cnt + 1
  
  decoder <- substr(input, i-3, i)
  
  if(sum(duplicated(unlist(strsplit(decoder, "")))) == 0) {
    print(cnt)
    break}
}

# 6.2
cnt <- 13

for(i in 14:nchar(input)){
  cnt <- cnt + 1
  
  decoder <- substr(input, i-13, i)
  
  if(sum(duplicated(unlist(strsplit(decoder, "")))) == 0) {
    print(cnt)
    break}
}
