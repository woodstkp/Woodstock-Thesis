setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(splines)
load("merge_HIV.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female")

mMod <- glmer(
  formula = hiv_pos ~
    log(nb.sex.partner)
  + marital_status 
  +  ns(Age, 4)
  + (1 | Country.code.and.phase/Cluster.number)
  , family = binomial(logit), data = mAnswers
)

summary(mMod)

## Sub-model without age
mModNoAge <- update(mMod, . ~ . - ns(Age, 4))
anova(mMod, mModNoAge)

## Sub-model without marital status 
mMod_no_MS <- update(mMod, . ~ . - marital_status)
anova(mMod,mMod_no_MS)

