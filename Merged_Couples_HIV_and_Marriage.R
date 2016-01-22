library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")

load("merge_couple.RData")
#Answers.couple$HIV.result.w <- Answers.couple$HIV.result.f

load("merge.RData")
Answers.individual <-Answers
rm(Answers)

## removes indiviudals without HIV test result
individual.HIV <- (Answers.individual
  %>% filter(
    (is.na(HIV.result.f)==FALSE) & (HIV.result.f!= "Indeterminant")
  )
)

## groups individuals with HIV1 and HIV2 together as HIV-positive
individual.HIV$HIV.result.f <-ifelse(individual.HIV$HIV.result.f== "HIV negative", "HIV negative","HIV positive")

## includes ony those married once
firstMarriage <- (Answers.couple 
  %>% filter(
    (Number.unions.f=="Once") & (Number.unions.m == "Once")
  )
)

##sum of reported years since marriage for both partners is less than one
newMarriage <- (firstMarriage 
  %>% filter(
    (Years.since.first.marriage.f + Years.since.first.marriage.m <= 1)
  )
)
rm(firstMarriage)

## removes couples where either partner has no HIV-test result
newMarriage.HIV <- (newMarriage
  %>%filter(
    (is.na(HIV.result.w)==FALSE) & (is.na(HIV.result.m)==FALSE)	      
  )
)
rm(newMarriage)

library(ggplot2)
print(
  ggplot(Answers.couple, aes(x=Years.since.first.marriage.f))
  + geom_histogram(binwidth=1)
)

print(
  ggplot(Answers.couple, aes(x=Years.since.first.marriage.m))
  + geom_histogram(binwidth=1)
)

print(
  ggplot(newMarriage.HIV, aes(x = current.age.f, fill = HIV.result.w))
  + geom_bar(binwidth=1)
)

print(
  ggplot(individual.HIV, aes(x=Age,fill=HIV.result.f))
  +geom_bar(binwidth=1)
)