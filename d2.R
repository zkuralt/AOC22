source("set_env.R")

library(adventdrob)
library(stringr)

input <- advent_input(day = 2, year = 2022, parse = TRUE)

# DAY 2 aka ifelse monstrosity

# 2.1

# A = rock
# B = paper
# C = scissors
# X = rock (1)
# Y = paper (2)
# Z = scissors (3)

# scoring
# w = 6
# d = 3
# l = 0

# AA AB AC BA BB BB CA CB CC

input$x<- str_replace_all(input$x, pattern = "X", "A")
input$x<- str_replace_all(input$x, pattern = "Y", "B")
input$x<- str_replace_all(input$x, pattern = "Z", "C")

input$total_score <- NA

for(i in 1:nrow(input)){
  match <- unlist(c(input[i, 1]))
  elf <- strsplit(x = match, split = " ")[[1]][1]
  me <- strsplit(x = match, split = " ")[[1]][2]
  
  selection_score <- ifelse(me == "A", 1, ifelse(me == "B", 2, 3))
  
  result <- ifelse(me == elf, "D", 
                   ifelse(me == "A" & elf == "B", "L",
                          ifelse(me == "A" & elf == "C", "W",
                                 ifelse(me == "B" & elf == "A", "W",
                                        ifelse(me == "B" & elf == "C", "L",
                                               ifelse(me == "C" & elf == "A", "L", "W"
                                               )
                                        )
                                 )
                          )
                   )
  )
  
  result_score <- ifelse(result == "D", 3, ifelse(result == "W", 6, 0))
  
  input$total_score[i] <- result_score + selection_score
}

sum(input$total_score)


## @nezapajek inspired solution

input <- advent_input(day = 2, year = 2022, parse = TRUE)

dict <- data.frame(match = unique(input$x))
dict$match
dict$value <- c(4, 3, 1, 2, 6, 8, 9, 5, 7)

score <- rep(NA, nrow(input))
for(i in 1:nrow(input)){
  score[i] <- dict$value[input$x[i] == dict$match]
}

sum(score)

# 2.2

input <- advent_input(day = 2, year = 2022, parse = TRUE)

input$x<- str_replace_all(input$x, pattern = "X", "L")
input$x<- str_replace_all(input$x, pattern = "Y", "D")
input$x<- str_replace_all(input$x, pattern = "Z", "W")


input$total_score <- NA

for(i in 1:nrow(input)){
  match <- unlist(c(input[i, 1]))
  elf <- strsplit(x = match, split = " ")[[1]][1]
  result <- strsplit(x = match, split = " ")[[1]][2]
  
  result_score <- ifelse(result == "D", 3, ifelse(result == "W", 6, 0))
  
  me <- ifelse(result == "D" & elf == "A", "A", 
               ifelse(result == "D" & elf == "B", "B",
                      ifelse(result == "D" & elf == "C", "C",
                             ifelse(result == "L" & elf == "A", "C",
                                    ifelse(result == "L" & elf == "B", "A",
                                           ifelse(result == "L" & elf == "C", "B",
                                                  ifelse(result == "W" & elf == "A", "B",
                                                         ifelse(result == "W" & elf == "B", "C", "A")
                                                  )
                                           )
                                    )
                             )
                      )
               )
  )
  
  selection_score <- ifelse(me == "A", 1, ifelse(me == "B", 2, 3))
  
  input$total_score[i] <- result_score + selection_score
}

sum(input$total_score)



## Again, @nezapajek is an inspiration (:

input <- advent_input(day = 2, year = 2022, parse = TRUE)

dict <- data.frame(match = unique(input$x))
dict$match
dict$value <- c(3, 8, 1, 6, 7, 4, 9, 5, 2)

score <- rep(NA, nrow(input))
for(i in 1:nrow(input)){
  score[i] <- dict$value[input$x[i] == dict$match]
}

sum(score)



