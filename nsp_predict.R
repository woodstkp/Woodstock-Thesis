setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(ggplot2)
theme_set(theme_bw())
library(splines)
load("number_sex_partners_regression.RData")

## Number sex partner prediction
fNSP <- with(fAnswers, data.frame(
  nb.sex.partner = log(nb.sex.partner) 
  , Age=mean(Age)
  , marital_status = marital_status[[1]]
  , Country.code.and.phase = Country.code.and.phase[[1]]
  , Cluster.number = Cluster.number[[1]]
))

summary(fNSP)

nPredict <- predict(fMod, newdata=fNSP, type = "response")

## Number sex partner prediction plot
nsp_df <- data.frame(fNSP$nb.sex.partner,nPredict)
names(nsp_df) <- c("nb.sex.partner","Prediction")

nsp_prediction <- ggplot(data = nsp_df,
   aes(x=nb.sex.partner, y=Prediction)
)

print(nsp_prediction
  + geom_smooth(color="black",se= TRUE)
  + geom_point(color="red",size=3)
  + ggtitle("Number of Sexual Partners as a Predictor of HIV risk")
  + ylab("Probability HIV+")
  + xlab("Number of Sexual Partners (Log Scale)")
)
