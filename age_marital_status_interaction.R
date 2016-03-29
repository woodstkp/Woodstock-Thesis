## ANCOVA to visualize interaction between age and marital status

setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(sjPlot)
load("merge_HIV.RData")
load("number_sex_partners_regression.RData")

mAnswers <- subset(Answers, gender=="Male")
fAnswers <- subset(Answers, gender=="Female")

## Analysis of variance of linear models
age_marriage_mod <- aov(
  hiv_pos~Age*marital_status, 
  data = fAnswers
)

summary(age_marriage_mod)

## Model with age/marital status interaction term
fMod_interaction <- update(fMod, . ~ . + ns(Age,4)*marital_status)

## Plotting the model
sjp.glmer(fMod_interaction, 
          type = "fe", 
          sort = TRUE)

