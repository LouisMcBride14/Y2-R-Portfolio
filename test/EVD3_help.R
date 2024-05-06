library(dplyr)
library(MASS)


dat_lv <- read.csv("C:\\Users\\Admin\\Documents\\University Work\\Y2\\Satistics and Probability Models Assessments\\R Portfolio\\Y2-R-Portfolio\\Data\\LV_load_monitor_721030.csv")

#dat_lv['Value'] <- as.numeric(dat_lv['Value'])

dat_lv <- dat_lv[dat_lv$Units == 'V',]

hist(dat_lv$Value, breaks=30)

# Fit normal distribution to the subset data
fit_gamma <- fitdistr(dat_lv$Value, densfun = "gamma")
print(fit_gamma)

test_data <- rgamma(10000,shape=fit_gamma$estimate['shape'],rate=fit_gamma$estimate['rate'])
hist(test_data, breaks = 30)

