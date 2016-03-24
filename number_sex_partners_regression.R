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
		+  ns(Age, 4)
		+ (1 | Country.code.and.phase/Cluster.number)
	, family = binomial(logit), data = fAnswers
)

## Parameter-level P values (this is all we need for nb.sex.partner, because in this model it only has one parameter
summary(fMod)

## We use sub-models to get variable-level P values
fModNoAge <- update(fMod, . ~ . - ns(Age, 4))
anova(fMod, fModNoAge)

## KW should make a similar sub-model for marital_status

fMod_no_MS <- update(fMod, . ~ . - marital_status)
anova(fMod,fMod_no_MS)

## Moving forward (probably in a separate file):

#### We want to think about interactions ... in particular the interaction between age and status, because we know we're worried about it.

#### we want to make "predictions" which will allow us to see the effect of each variable while controlling for the others. This should probably be done by making special data frames where we hold all but one variable constant, and then using the predict function.

#### See what you can learn about this insane warning. Google it a bit, and then bother Ben with a copy to me. You can start by asking him whether he wrote that article and if so how the heck we're supposed to know that.

#### Give each figure that might be in your thesis a logical name, and document these names and how the figures are made in the Makefile 
