setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(ggplot2)
theme_set(theme_bw())
library(splines)
load("number_sex_partners_regression.RData")

## Number sex partner prediction
fNSP <- with(fAnswers, data.frame(
  nb.sex.partner = nb.sex.partner 
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
  + geom_smooth(color="red",se= TRUE)
  + scale_x_log10(breaks = c(1,2,5,10,20,50,100))
# + scale_y_log10(breaks = c(0.03,0.05,0.1,0.15,0.2))
  + ggtitle("Number of Sexual Partners as a Predictor of HIV risk")
  + ylab("Probability HIV+")
  + xlab("Number of Sexual Partners (Log Scale)")
)
