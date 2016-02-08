library(ggplot2)

setwd("~/Dropbox/Woodstock_thesis")

load("merge_HIV.RData")


## Proportion of HIV positive individuals 
print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
)

## Proportion by country
print(
  ggplot(Answers) +aes(x=Age, fill=HIV.result.f)+geom_bar(position="fill",binwidth=1)
  + scale_fill_brewer(palette="BrBG") +xlab("Current age (Female)") + ylab("Proportions")
  + facet_grid(~Country.code.and.phase)
)


## Proportion by marriage
print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(~Ever.been.married.all)
)

print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(Ever.been.married.all~gender)
)

## Proportion of HIV positive individuals by current marital status
print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(~marital_status)
)

print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(marital_status~gender)
)


## Proportion by marriage and country
print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(Country.code.and.phase~marital_status)
)

print(
  ggplot(Answers)+aes(x=Age, fill=HIV.result.f)
  +geom_bar(position="fill",binwidth=1) + scale_fill_brewer(palette="BrBG")
  +facet_grid(Country.code.and.phase~Ever.been.married.all)
)


