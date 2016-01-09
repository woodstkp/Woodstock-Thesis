library(dplyr)
setwd("~/Dropbox/Woodstock_thesis")
load("~/Dropbox/Woodstock_thesis/ke5c.RData")
coupleAnswers <- Answers


firstMarriage <- (coupleAnswers 
	%>% filter(
		(Number.unions.f=="Once") & (Number.unions.m == "Once")
	)
)

print(nrow(firstMarriage))

with(firstMarriage, {
	table(Years.since.first.marriage.m, Years.since.first.marriage.f)
})

##sum of reported years since marriage for both partners is less than one
newMarriage <- (firstMarriage
  %>%filter(
    (Years.since.first.marriage.f+Years.since.first.marriage.m <=1)
  )
)

#quit()

library(ggplot2)
print(
	ggplot(coupleAnswers, aes(x=Years.since.first.marriage.f))
	+ geom_histogram()
)

print(
	ggplot(coupleAnswers, aes(x=Years.since.first.marriage.m))
	+ geom_histogram()
)
