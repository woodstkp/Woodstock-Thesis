library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")

load("merge_couple.RData")

## HIV result variable renamed
Answers.couple$HIV.result.f <- Answers.couple$HIV.result.w
Answers.couple$HIV.result.w <- NULL 

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

## includes couples with women married only once
firstMarriage <- (Answers.couple 
  %>% filter(
    (Number.unions.f=="Once") 
  )
)

##sum of reported years since marriage for both partners is less than one
newMarriage <- (firstMarriage 
  %>% filter(
    (Years.since.first.marriage.f + Years.since.first.marriage.m <= 1)
  )
)
rm(firstMarriage)

## removes couples where woman has no HIV-test result
newMarriage.HIV <- (newMarriage
  %>%filter(
    (is.na(HIV.result.f)==FALSE)         
  )
)
rm(newMarriage)

library(ggplot2)
print(
  ggplot(newMarriage.HIV, aes(x = current.age.f, fill = HIV.result.f))
  + geom_bar(binwidth=1)
)

print(
  ggplot(individual.HIV, aes(x=Age,fill=HIV.result.f))
  +geom_bar(binwidth=1)
) 

individual.HIV$HIV.result.f <-ifelse(individual.HIV$HIV.result.f== "HIV negative", 0,1)
newMarriage.HIV$HIV.result.f <-ifelse(newMarriage.HIV$HIV.result.f== "HIV negative", 0,1)

## binomial test looking at the proportion of women with HIV in recent marriage vs the general population
binom.test(sum(newMarriage.HIV$HIV.result.f),length(newMarriage.HIV$HIV.result.f),mean(individual.HIV$HIV.result.f),"t")