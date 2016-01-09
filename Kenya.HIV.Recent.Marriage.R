library(dplyr)
library(ggplot2)

setwd("~/Dropbox/Woodstock_thesis")

load("ke5c.RData")
coupleAnswers <- Answers
coupleAnswers$HIV.result.f <- coupleAnswers$HIV.result.w

load("ke5.RData")
individualAnswers <- Answers


firstMarriage <- (coupleAnswers 
	%>% filter(
		(Number.unions.f=="Once") & (Number.unions.m == "Once")
	)
)

newMarriage <- (firstMarriage 
		%>% filter(
		  (Years.since.first.marriage.f == 0) & (Years.since.first.marriage.m == 0)
		)
)

newMarriage.HIV <- (newMarriage
		    %>%filter(
		      (is.na(HIV.result.f)==FALSE) & (is.na(HIV.result.m)==FALSE)	      
		      )
)


individualHIV <- (individualAnswers
		  %>%filter(
		    (is.na(HIV.result.f)==FALSE)
		    )
)

# individualHIV$HIV.result.f <-ifelse(individualHIV$HIV.result.f== "HIV  positive", 1,0)
# newMarriage.HIV$HIV.result.w <-ifelse(newMarriage.HIV$HIV.result.w== "HIV  positive", 1,0)

print(names(individualHIV))

print(
	ggplot(individualHIV, aes(x = Age, fill = HIV.result.f))
	+ geom_bar(position = "fill",binwidth=1)
)

ggplot(newMarriage.HIV,aes(x = current.age.f,fill = HIV.result.f)) + 
  geom_bar(position = "fill", binwidth=1)
