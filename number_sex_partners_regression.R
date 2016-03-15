setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
load("merge_HIV.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female")


HIV_nsp <- glmer(formula = hiv_pos ~ log(nb.sex.partner)+ Age 
  + marital_status + (1 | Country.code.and.phase/Cluster.number), 
  family = binomial(logit), data = fAnswers
)

HIV_nsp2 <- glmer(formula = hiv_pos ~ log(nb.sex.partner)+ Age 
  + marital_status + (1 | Country.code.and.phase), 
  family = binomial(logit), data = fAnswers
)

HIV_nsp3 <- glmer(formula = hiv_pos ~ log(nb.sex.partner)+ log(nb.sex.partner):Age 
  + (1 | Country.code.and.phase), 
  family = binomial(logit), data = fAnswers
)

anova(HIV_nsp,HIV_nsp2)
anova(HIV_nsp,HIV_nsp3)
summary(HIV_nsp)
