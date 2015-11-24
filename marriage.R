library(dplyr)

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

quit()

library(ggplot2)
print(
	ggplot(Answers, aes(x=Years.since.first.marriage.f))
	+ geom_histogram()
)

print(
	ggplot(Answers, aes(x=Years.since.first.marriage.m))
	+ geom_histogram()
)
