setwd("~/Dropbox/Woodstock_thesis")

library("ggplot2")
library("splines")

load("merge_couple_HIV.RData")
load("merge_HIV.RData")

recentmarr <- subset(Answers.couple, recent_marriage == TRUE)
nevermarr <- subset(Answers, marital_status == "never" & gender == "Female")

## Plotting graph
print(
  ggplot()
    +geom_smooth(data=nevermarr, aes(
      x=Age, y= as.numeric(hiv_pos),col="Never Married"), 
      method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE)
  
    +geom_smooth(
      data=recentmarr, aes(
        x=current.age.f, y= as.numeric(hiv_pos),col="Recently Married"),
        method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE)
  
  + ylab("Proportion HIV+")
  + ggtitle("HIV Prevalence in Never Married and Recently Married Women")
  + scale_color_manual("Marital Status", values = c("red","blue") )
)

print(
  ggplot(recentmarr, aes (x=Age))
    +geom_histogram(binwidth=1)
    +ggtitle("Age Distribution of Recently Married Women")  
)
