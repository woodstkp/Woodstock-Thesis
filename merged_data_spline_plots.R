# method.args = list(family = "binomial")

library(ggplot2)
theme_set(theme_bw())

library(splines)
setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")
load("Country_recode.RData")

ever_married_plot <- ggplot(data = Answers,
	aes(x=Age, y=as.numeric(hiv_pos), colour=Ever.been.married.all)
)

gender_plot <- ggplot(data = Answers,
	aes(x=Age, y=as.numeric(hiv_pos), colour=gender)
)

marital_status_plot <- ggplot(data = Answers,
aes(x=Age, y=as.numeric(hiv_pos), colour=marital_status)
)

## HIV risk by gender
HIV_risk_by_gender <- (gender_plot + scale_colour_brewer(palette="Set1")
	+ geom_smooth(method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE) 
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender")
)
print(HIV_risk_by_gender)


## Proportion by country
HIV_proportion_by_country <- (gender_plot
	+ geom_smooth(method="glm",method.args=list("binomial"), formula=y~ns(x, 4),na.rm=FALSE) 
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Gender and Country")
	+facet_wrap(~Country.code.and.phase)
)
print(HIV_proportion_by_country)

## Proportion by ever married
HIV_probability_by_marital_status <- (ever_married_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")				 
)
print(HIV_probability_by_marital_status)

HIV_prob_marital_status_and_gender <- (ever_married_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status")	
	+facet_wrap(~gender)
)
print(HIV_prob_marital_status_and_gender)

## Proportion by current marital status
HIV_prob_current_marital_status <- (marital_status_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
)
print(HIV_prob_current_marital_status)

HIV_prob_current_marital_status_and_gender <- (marital_status_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
	+facet_wrap(~gender)
)
print(HIV_prob_current_marital_status_and_gender)

## Proportion by marriage and country
HIV_prob_current_marital_status_and_country <- (marital_status_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Current Marital Status") 
	+facet_wrap(~Country.code.and.phase)
)
print(HIV_prob_current_marital_status_and_country)

HIV_prob_marital_status_and_country <- (ever_married_plot
	+ geom_smooth(method="glm",method.args=list("binomial"),formula=y~ns(x,4),na.rm=FALSE)			
	+ylab("Proportion HIV+") +ggtitle("HIV Probability by Marital Status") 
	+facet_wrap(~Country.code.and.phase)
)
print(HIV_prob_marital_status_and_country)