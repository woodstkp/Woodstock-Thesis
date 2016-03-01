library(ggplot2)
library(splines)
library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")

## Removing individuls with no response for age at first sex or number of partners 
## Filter these numbers a little more carefully
Answers <-(Answers
	%>%filter((Age.first.sex <=50) & (nb.sex.partner <40))
)

## Bases for plots 
hivXafs <- ggplot(data = Answers,
	aes(x=Age.first.sex, y=as.numeric(hiv_pos), colour=gender)
)

hivXnsp <- ggplot(data = Answers,
	aes(x=log(nb.sex.partner), y=as.numeric(hiv_pos), colour=gender)
)

## Plotting graphs
print(hivXafs
	+ geom_smooth(
		method="glm",method.args=list("binomial"),
		formula=y~ns(x,4),na.rm=FALSE
	)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Age at First Sex") 
)

print(hivXnsp
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Number of Sexual Partners") 
)

## Frequency of responses
print(
	ggplot(Answers, aes(x=Age.first.sex))
	+ geom_histogram(binwidth=1) +ggtitle("Age at First Sex")
)

print(
	ggplot(Answers,aes(x=nb.sex.partner))
	+geom_histogram(binwidth=1) + ggtitle("Number of sexual partners")
)
