library(dplyr)

firstMarriage <- (Answers 
	%>% filter(
		(Number.unions.f=="Once") & (Number.unions.m == "Once")
	)
)

newMarriage <- (firstMarriage 
	%>% filter(
		(Years.since.first.marriage.f == 0) & (Years.since.first.marriage.m == 0)
	)
)

