library(ggplot2)
library(splines)
library(dplyr)
library(Matrix)

source("infs.R")
setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female",
	select=c("nb.sex.partner", "hiv_pos")
)

nspFmod <- glm(sample(hiv_pos) ~ infs(log(nb.sex.partner), 4)
	, family="binomial", data=fAnswers
)

print(summary(nspFmod))
