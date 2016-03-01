library(ggplot2)
library(splines)
library(dplyr)

setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")

## Bases for plots 
hivXafs <- ggplot(data = Answers,
	aes(x=Age.first.sex, y=as.numeric(hiv_pos), colour=gender)
)

hivXnsp <- ggplot(data = Answers,
	aes(x=log(nb.sex.partner), y=as.numeric(hiv_pos), colour=gender)
)

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female",
	select=c("nb.sex.partner", "hiv_pos")
)
print(nrow(fAnswers))
print(nrow(na.omit(fAnswers)))

nspFspl <- with(fAnswers, ns(log(nb.sex.partner), 4))
print(attributes(nspFspl))
print((nspFspl))

nspFmod <- glm(sample(hiv_pos) ~ ns(log(nb.sex.partner), 4)
	, family="binomial", data=fAnswers
)

print(summary(nspFmod))
rankMatrix(model.matrix(nspFmod))
summary(model.matrix(nspFmod))
smm <- model.matrix(nspFmod)[, -1]
rankMatrix(smm)

summary(fAnswers)

rankMatrix(nspFspl)
dim(nspFspl)

nspMmod <- glm(hiv_pos ~ ns(log(nb.sex.partner), 4)
	, family="binomial", data=mAnswers
)

print(summary(nspMmod))
