# Set working directory
setwd('C:\\Users\\Admin\\Documents\\University Work\\Y2\\R Portfolio\\Y2-R-Portfolio\\Data')

# Read the CSV file
dat <- read.csv('Bristol.csv')

# Convert 'datetime' to POSIXct
dat$datetime <- as.POSIXct(dat$datetime, format = "%Y-%m-%d %H:%M:%S")

# Aggregate solar radiation by hour and calculate the mean
hourly_avg <- tapply(dat$solarradiation, INDEX = dat$hour, FUN = mean)

# Plot hourly average solar radiation
plot(hourly_avg, type = "o", xlab = "Hour of the Day", ylab = "Average Solar Radiation", main = "Hourly Average Solar Radiation")

x=rgamma(100000,shape=5,rate=5)
hist(x)

hist(dat$solarradiation)



plot(dat$solarradiation)

hist(dat$solarradiation, breaks=20)



# Assuming your data is stored in a data frame named 'solar_data'
# 'datetime' column should be in POSIXct format
library(MASS)

# List to store estimated parameters for each hour
params_list <- list()

# Loop through each hour
for (hour in unique(dat$hour)) {
  # Subset data for the current hour
  subset_data <- dat[dat$hour == hour, "solarradiation"]
  
  # Fit gamma distribution to the subset data
  fit <- fitdistr(subset_data, densfun = "gamma")
  
  # Extract estimated parameters and store in the list
  params_list[[as.character(hour)]] <- fit$estimate
}

# Print the estimated parameters for each hour
print(params_list)