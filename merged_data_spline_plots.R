# method.args = list(family = "binomial")

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
	+ geom_smooth(method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE) 
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender")
)

ggsave(file="HIV_risk_by_gender.png")

## Proportion by country
print(p2
	+ geom_smooth(method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE) 
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender and Country")
	+facet_wrap(~Country.code.and.phase)
)

ggsave("HIV_proportion_by_country.png")


## Proportion by ever married
print(p1
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")				 
)

ggsave("HIV_probability_by_marital_status.png")

print(p1
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")	
	+facet_wrap(~gender)
)

ggsave("HIV_prob_marital_status_and_gender.png")

## Proportion by current marital status
print(p3
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
)

ggsave("HIV_prob_current_marital_status.png")

print(p3
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
	+facet_wrap(~gender)
)

ggsave("HIV_prob_current_marital_status_and_gender.png")

## Proportion by marriage and country
print(p3
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
	+facet_wrap(~Country.code.and.phase)
)

ggsave("HIV_prob_current_marital_status_and_country.png")

print(p1
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status") 
	+facet_wrap(~Country.code.and.phase)
)

ggsave("HIV_prob_marital_status_and_country.png")

