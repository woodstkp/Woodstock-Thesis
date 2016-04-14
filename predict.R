setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(ggplot2)
  theme_set(theme_bw())
library(splines)
load("number_sex_partners_regression.RData")

## Age Prediction
fAge <- with(fAnswers, data.frame(
	Age=Age
	, nb.sex.partner=mean(nb.sex.partner) 
	, marital_status=marital_status[[1]]
	, Country.code.and.phase = Country.code.and.phase[[1]]
	, Cluster.number = Cluster.number[[1]]
))

summary(fAge)

aPredict <- predict(fMod, newdata=fAge, type="response")

## Creating Confidence Intervals
confint(fMod,aPredict)

FUN <- function(fMod){
  aPredict <- predict(fMod, newdata=fAge, type="response")
}
predBoot <- bootMer(fMod, FUN, use.u=FALSE)
summary(predBoot)


## Creating age prediction plot
Age_df <- data.frame(fAge$Age,aPredict)
names(Age_df) <- c("Age","Prediction")

age_prediction <- ggplot(data = Age_df,
  aes(x=Age, y=Prediction)
)

print(age_prediction
  + geom_smooth(color="black",se= TRUE)
  + geom_point(color="red",size=3)
  + ggtitle("Age as a Predictor of HIV risk")
  + ylab("Probability HIV+")
)