library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")

load("merge_couple.RData")

## HIV result variable renamed
Answers.couple$HIV.result.f <- Answers.couple$HIV.result.w
Answers.couple$HIV.result.w <- NULL 

## groups individuals with HIV1 and HIV2 together as HIV-positive
Answers.couple$HIV.result.f <-ifelse(Answers.couple$HIV.result.f== "HIV negative", "HIV negative","HIV positive")

## Women recently married for the first time with available HIV status
Anss_new_marr_f <- (Answers.couple
    %>% filter(Number.unions.f=="Once")
      %>% filter(Years.since.first.marriage.f + Years.since.first.marriage.m <= 1)
        %>% filter(is.na(HIV.result.f)==FALSE  & (HIV.result.f!= "Indeterminant"))
)

## Men recently married for the first time with available HIV status 
Ans_new_marr_m <- (Answers.couple
  %>% filter(Number.unions.m=="Once")
    %>% filter(Years.since.first.marriage.f + Years.since.first.marriage.m <= 1)
      %>% filter(is.na(HIV.result.m)==FALSE  & (HIV.result.m!= "Indeterminant"))          
  )

rm(Answers.couple)