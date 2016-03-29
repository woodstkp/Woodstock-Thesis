### Load stuff or whatever

fAge <- with(fAnswers, data.frame(
	Age=Age
	, nb.sex.partner=mean(nb.sex.partner) 
	, marital_status=marital_status[[1]]
	, Country.code.and.phase = Country.code.and.phase[[1]]
	, Cluster.number = Cluster.number[[1]]
))

summary(fAge)

aPredict <- predict(fMod, newdata=fAge, type="response")

summary(aPredict)

plot(fAge$Age, aPredict)
