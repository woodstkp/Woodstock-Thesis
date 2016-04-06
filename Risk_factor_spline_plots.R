library(ggplot2)
theme_set(theme_bw())

library(splines)
library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")
load("Country_recode.RData")
source("infs.R")

## Removing individuls with no response for age at first sex or number of partners 
## Filter these numbers a little more carefully
Answers <-(Answers
	%>%filter((Age.first.sex <=50) & (nb.sex.partner <90))
)

## Bases for plots 
hivXafs <- ggplot(data = Answers,
	aes(x=Age.first.sex, y=as.numeric(hiv_pos), colour=gender)
)

hivXnsp <- ggplot(data = Answers,
	aes(x=nb.sex.partner, y=as.numeric(hiv_pos), colour=gender)
)

## Plotting graphs
HIV_and_age_of_sexual_debut <- (hivXafs
	+ geom_smooth(
		  method="glm",method.args=list("binomial"),
		  formula=y~ns(x,4),na.rm=FALSE
	)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Age at First Sex") 
)
print(HIV_and_age_of_sexual_debut)

HIV_and_number_sex_partners <- (hivXnsp 
  +scale_x_log10(breaks = c(1,2,5,10,20,50,100))
  + xlab("Number of Sexual Partners")
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~infs(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Number of Sexual Partners") 
)
print(HIV_and_number_sex_partners)

## Frequency of responses
print(
	ggplot(Answers, aes(x=Age.first.sex))
	+ geom_histogram(binwidth=1) +ggtitle("Age at First Sex")
)

nsp_histogram <- (ggplot(Answers,aes(x=nb.sex.partner))
	+geom_histogram(binwidth=1) + ggtitle("Number of sexual partners")
)
print(nsp_histogram)

nsp_log_histogram <- (ggplot(Answers,aes(x=nb.sex.partner))
  + scale_x_log10(breaks = c(1,2,5,10,20,50,100))
  + geom_histogram(binwidth=0.2) + ggtitle("Number of sexual partners")
)
print(nsp_log_histogram)
