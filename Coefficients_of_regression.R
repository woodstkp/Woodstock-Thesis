library(coefplot2)]
library("number_sex_partners_regression.RData")

#### We want to think about interactions ... in particular the interaction between age and status, because we know we're worried about it.

coefplot2(fMod)
coefplot2(fModNoAge)
coefplot2(fMod_no_MS)
