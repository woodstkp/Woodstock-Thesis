library(dplyr)
setwd("~/Dropbox/Woodstock_thesis")
load("merge.RData")


## groups individuals with HIV1 and HIV2 together as HIV-positive
Answers$HIV.result.f <-ifelse(Answers$HIV.result.f== "HIV negative", "HIV negative","HIV positive")

## removes indiviudals without HIV test result
Answers <- (Answers
  %>% filter(
    (is.na(HIV.result.f)==FALSE) & (HIV.result.f!= "Indeterminant")
    ##& (Result.HIV =="Blood taken")
  )
)

## creates variable for HIV-positive individuals
Answers$hiv_pos <- ifelse(Answers$HIV.result.f == "HIV positive",TRUE,FALSE)


## Removes indivudals with no marital status information available
Answers <- (Answers
  %>% filter(
    (is.na(Curr.form.never.marr)==FALSE)
  )          
)

## Changes order of factors in HIV status variable (for later plotting)
Answers$HIV.result.f <- factor(Answers$HIV.result.f, levels = c("HIV positive", "HIV negative"))

## number of factors in curr.form.never.marr variable reduced to former, current and never
## individuals in union grouped with married individuals
Answers$Curr.form.never.marr <- as.character(Answers$Curr.form.never.marr)

Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly married"] <- "former"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly in union/living with a man"] <- "former"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Formerly in union/living with a woman"] <- "former"

Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently married"] <- "current"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently in union/living with a man"] <- "current"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Currently in union/living with a woman"] <- "current"

Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Never married"] <- "never"
Answers$Curr.form.never.marr[Answers$Curr.form.never.marr == "Never in union"] <- "never"

Answers$marital_status <- factor(Answers$Curr.form.never.marr,levels=c("current","former","never"))

Answers$Curr.form.never.marr <- NULL
Answers$Current.marital.status <- NULL

## Ever been married all variable created to include responses from currently married individuals as well
Answers$Ever.been.married.all <-ifelse(Answers$Ever.been.married == "No", "No","Yes")
Answers$Ever.been.married.all[is.na(Answers$Ever.been.married.all) == TRUE] <- "Yes"
Answers$Ever.been.married.all <- as.factor(Answers$Ever.been.married.all)

## Removing individuls with no response for age at first sex or number of partners 
## Filter these numbers a little more carefully
Answers <-(Answers
	%>% filter((Age.first.sex <=50) & (nb.sex.partner <40))
)
