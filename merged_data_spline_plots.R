library(ggplot2)
library(splines)
setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")


p1 <- ggplot(data = Answers,
  aes(x=Age, y=as.numeric(hiv_pos), colour=Ever.been.married.all)
)

p2 <- ggplot(data = Answers,
  aes(x=Age, y=as.numeric(hiv_pos), colour=gender)
)

p3 <- ggplot(data = Answers,
aes(x=Age, y=as.numeric(hiv_pos), colour=marital_status)
)

## HIV risk by gender
print(p2 + scale_colour_brewer(palette="Set1")
  + geom_smooth(method="glm",family="binomial", formula=y~ns(x, 4),na.rm=FALSE) 
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender")
)

## Proportion by country
print(p2
  + geom_smooth(method="glm",family="binomial", formula=y~ns(x, 4),na.rm=FALSE) 
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender and Country")
  +facet_wrap(~Country.code.and.phase)
)


## Proportion by ever married
print(p1
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")         
)

print(p1
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")  
  +facet_wrap(~gender)
)

## Proportion by current marital status
print(p3
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
)

print(p3
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
  +facet_wrap(~gender)
)


## Proportion by marriage and country
print(p3
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
  +facet_wrap(~Country.code.and.phase)
)

print(p1
  + geom_smooth(method="glm",family="binomial",formula=y~ns(x,4),na.rm=FALSE)      
  +ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status") 
  +facet_wrap(~Country.code.and.phase)
)

