load("~/R/ke5c.RData")
library(dplyr)
library(ggplot2)

coupleAnswers <- Answers

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
		      (is.na(HIV.result.w)==FALSE) & (is.na(HIV.result.m)==FALSE)	      
		      )
)


individualHIV <- (Answers
		  %>%filter(
		    (is.na(HIV.result.w)==FALSE)
		    )
)

# individualHIV$HIV.result.f <-ifelse(individualHIV$HIV.result.f== "HIV  positive", 1,0)
# newMarriage.HIV$HIV.result.w <-ifelse(newMarriage.HIV$HIV.result.w== "HIV  positive", 1,0)

print(names(individualHIV))

print(
	ggplot(individualHIV, aes(x = current.age.f, fill = HIV.result.w))
	+ geom_bar(position = "fill",binwidth=1)
)

ggplot(newMarriage.HIV,aes(x = current.age.f,fill = HIV.result.w)) + 
  geom_bar(position = "fill", binwidth=1)
