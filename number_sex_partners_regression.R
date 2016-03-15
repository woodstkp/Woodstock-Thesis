setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(splines)
load("merge_HIV.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female")

fMod <- glmer(
	formula = hiv_pos ~
		log(nb.sex.partner)
		+ marital_status 
		+ (1 | Country.code.and.phase/Cluster.number)
	, family = binomial(logit), data = fAnswers
)

fModAge <- update(fMod, . ~ . + ns(Age, 4))

summary(fModAge)
anova(fModAge, fMod)
