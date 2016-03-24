setwd("~/Dropbox/Woodstock_thesis")
library(coefplot2)
load("number_sex_partners_regression.RData")

#### We want to think about interactions ... in particular the interaction between age and status, because we know we're worried about it.

regression_plot <- coefplot2(fMod)

coefplot2(fModNoAge)
coefplot2(fMod_no_MS)
