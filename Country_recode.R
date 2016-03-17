## Changing country codes to make ggplot  labels more clear

setwd("~/Dropbox/Woodstock_thesis")
load("merge_HIV.RData")

Answers$Country.code.and.phase <- as.character(Answers$Country.code.and.phase)

Answers$Country.code.and.phase[Answers$Country.code.and.phase == "BF6"] <- "Burkina Faso"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "CM6"] <- "Cameroon"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "ET6"] <- "Ethiopia"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "KE5"] <- "Kenya"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "LS5"] <- "Lesotho"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "ML5"] <- "Mali"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "MW5"] <- "Malawi"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "RW6"] <- "Rwanda"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "SN6"] <- "Senegal"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "SZ5"] <- "Swaziland"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "TZ5"] <- "Tanzania"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "ZM5"] <- "Zambia"
Answers$Country.code.and.phase[Answers$Country.code.and.phase == "ZW6"] <- "Zimbabwe"

Answers$Country.code.and.phase <- as.factor(Answers$Country.code.and.phase)
