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

x=rexp(600, rate=0.0035629454)
hist(x)

#remove 0 values
dat <- dat[dat["solarradiation"] > 0,]
hist(dat$solarradiation, breaks=10)



# Assuming your data is stored in a data frame named 'solar_data'
# 'datetime' column should be in POSIXct format
library(MASS)

  
# Fit exponential distribution to the subset data
fit <- fitdistr(dat$solarradiation, densfun = "exponential")
print(fit)
  




dailys <- c()

for (day in unique(dat$date)) {
  filter <- dat[dat['date'] == day,]
  total <- sum(filter$solarradiation)
  
  print(total)
  
  dailys <- append(dailys, total)
}

hist(dailys)


# Fit gamma distribution to the subset data
fit2 <- fitdistr(dailys, densfun = "normal")
print(fit2)

hist(rnorm(1000, 4032.0244, 1463.3986))







avgs <- c()

for (day in unique(dat$date)) {
  filter <- dat[dat['date'] == day,]
  avg <- mean(filter$solarradiation)
  
  print(avg)
  
  avgs <- append(avgs, avg)
}

hist(avgs)


# Fit gamma distribution to the subset data
fit2 <- fitdistr(peaks, densfun = "normal")
print(fit2)

hist(rnorm(1000, 4032.0244, 1463.3986))










