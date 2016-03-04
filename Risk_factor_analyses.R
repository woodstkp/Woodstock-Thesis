library(ggplot2)
library(splines)
library(dplyr)
library(Matrix)


setwd("~/Dropbox/Woodstock_thesis")
source("dns.R")
source("infs.R")
load("merge_HIV.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female",
	select=c("nb.sex.partner", "hiv_pos")
)

nspFmod <- glm(sample(hiv_pos) ~ infs(log(nb.sex.partner), 4)
	, family="binomial", data=fAnswers
)

print(summary(nspFmod))


hivXnsp <- ggplot(data = Answers,
  aes(x=log(nb.sex.partner), y=as.numeric(hiv_pos), colour=gender)
)

print(hivXnsp
  + geom_smooth(method="glm",method.args=list("binomial"), formula=y~infs(x, 4),na.rm=FALSE) 
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Number of Sexual Partners")
    
)

print(hivXnsp
  + geom_smooth(method="glm",method.args=list("binomial"), formula=y~dns(x, 4),na.rm=FALSE) 
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Number of Sexual Partners")
      
)
