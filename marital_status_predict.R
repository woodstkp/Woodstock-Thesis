setwd("~/Dropbox/Woodstock_thesis")

library(lme4)
library(ggplot2)
theme_set(theme_bw())
library(splines)
load("number_sex_partners_regression.RData")


## Marital status prediction
f_ms <- with(fAnswers, data.frame(
  marital_status = marital_status
  , nb.sex.partner=mean(nb.sex.partner) 
  , Age=mean(Age)
  , Country.code.and.phase = Country.code.and.phase[[1]]
  , Cluster.number = Cluster.number[[1]]
))

summary(f_ms)

mPredict <- predict(fMod, newdata=f_ms, type="response")

## Creating marital status prediction plot
plot(x = f_ms$marital_status,mPredict
     , ylab = "Probability HIV+"
     , main = "Marital Status as a Predictor of HIV Risk"
)


ms_df <- data.frame(f_ms$marital_status,mPredict)
names(ms_df) <- c("Marital_Status","Prediction")


ms_prediction <- ggplot(data = ms_df,
                         aes(x=Marital_Status, y=Prediction)
)

print(ms_prediction
      + geom_point(color="red",size=4)
      + ggtitle("Marital Status as a Predictor of HIV Risk")
      + ylab("Probability HIV+")
      + xlab("Marital Status")
)
