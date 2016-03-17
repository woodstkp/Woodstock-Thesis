library(ggplot2)
library(splines)
setwd("~/Dropbox/Woodstock_thesis")

load("merged_data_spline_plots.RData")

ggsave(file="HIV_risk_by_gender.png",plot=HIV_risk_by_gender)
ggsave("HIV_proportion_by_country.png",plot=HIV_proportion_by_country)
ggsave("HIV_probability_by_marital_status.png",plot=HIV_probability_by_marital_status)
ggsave("HIV_prob_marital_status_and_gender.png",plot=HIV_prob_marital_status_and_gender)
ggsave("HIV_prob_current_marital_status.png",plot=HIV_prob_current_marital_status)
ggsave("HIV_prob_current_marital_status_and_gender.png",
       plot=HIV_prob_current_marital_status_and_gender)
ggsave("HIV_prob_current_marital_status_and_country.png",
       plot=HIV_prob_current_marital_status_and_country)
ggsave("HIV_prob_marital_status_and_country.png",plot=HIV_prob_marital_status_and_country)

load("Risk_factor_spline_plots.RData")
ggsave("HIV_and_age_of_sexual_debut.png",plot=HIV_and_age_of_sexual_debut)
ggsave("HIV_and_number_sex_partners.png",plot=HIV_and_number_sex_partners)
