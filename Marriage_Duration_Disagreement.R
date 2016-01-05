library(dplyr)

setwd("~/R") # May be wrong, please don't uncomment it on the repo
load("merge_couple.RData")

firstMarriage <- (Answers.couple 
                  %>% filter(
                    (Number.unions.f=="Once") & (Number.unions.m == "Once")
                  )
)

#woman's reported years since marriage - man's report
firstMarriage$marriage.duration.disagreement <- firstMarriage$Years.since.first.marriage.f - firstMarriage$Years.since.first.marriage.m

library(ggplot2)
print(
  ggplot(firstMarriage, aes(x = marriage.duration.disagreement))
  + geom_histogram(binwidth=1)
)