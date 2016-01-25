library(dplyr)
library(lme4)

setwd("~/Dropbox/Woodstock_thesis")

load("merge.RData")

Answers <- (Answers
  %>% filter(
    (HIV.result.f != "Indeterminant")
  )
)

## groups individuals with HIV1 and HIV2 together as HIV-positive
Answers$HIV.result.f <-ifelse(Answers$HIV.result.f== "HIV negative", "HIV negative","HIV positive")


## number of factors in curr.form.never.marr variable reduced to former, current and never
## individuals in union grouped with married individuals
Answers$Curr.form.never.marr <- as.character(Answers$Curr.form.never.marr)

Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly married"] <- "former"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly in union/living with a man"] <- "former"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly in union/living with a woman"] <- "former"

Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently married"] <- "current"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently in union/living with a man"] <- "current"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently in union/living with a woman"] <- "current"

Answers$marital_status <- as.factor(Answers$Curr.form.never.marr)
Answers$Curr.form.never.marr <- NULL
Answers$Current.marital.status <- NULL

## Ever been married all variable created to include responses from currently married individuals as well
Answers$Ever.been.married.all <-ifelse(Answers$Ever.been.married == "No", "No","Yes")
Answers$Ever.been.married.all[is.na(Answers$Ever.been.married.all) == TRUE] <- "Yes"
Answers$Ever.been.married.all[is.na(Answers$marital_status) == TRUE] <- NA
Answers$Ever.been.married.all <- as.factor(Answers$Ever.been.married.all)
