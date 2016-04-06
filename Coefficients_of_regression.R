setwd("~/Dropbox/Woodstock_thesis")
library(coefplot2)
load("number_sex_partners_regression.RData")


regression_plot <- coefplot2(fMod)
plot(regression_plot)


coefplot2(fModNoAge)
coefplot2(fMod_no_MS)
