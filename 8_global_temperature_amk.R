# 2022-02-10
# temp anomaly 



# temp_anomaly = read.table("data/647_Global_Temperature_Data_File.txt", skip=5, sep="", header = FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))
url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))
class(temp_anomaly)
head(temp_anomaly)
dim(temp_anomaly)
summary(temp_anomaly)

temp_1998 = temp_anomaly$No_Smoothing[temp_anomaly$Year == 1998]
temp_2012 = temp_anomaly$No_Smoothing[temp_anomaly$Year == 2012]

plot(No_Smoothing ~ Year, data=temp_anomaly, ylab="Global mean temperature anomaly (C)") + 
  # type="b") # type =b is points and a line! 
  lines(No_Smoothing ~ Year, data=temp_anomaly) +
  lines(Lowess_5 ~ Year, data=temp_anomaly, col="red") 
abline(v=1998, lty='dashed')
abline(v=2012, lty='dashed')
lines(c(temp_1998,temp_2012) ~ c(1998,2012), col='blue', lwd= 2)

# wikipedia warning hiatus 
# subset a graph IPCC - used data through 1998- 2012 which made it seem  
# a single low point does not denote a specific trend 


# want to create a user defined function that creates a rolling average 
# user can choose the size of the moving window 


data = c(1,3,5,7,9,11,13,15)
# user passes vector of ordered time series data
calc_rolling_avg = function(data, moving_window=5){
  result = rep(NA, length(data)) # initializng results vector 
  for(i in c(moving_window:length(data))){ #starting at moving window because otherwise would not be acurate for the first 4 variables 
    result[i] = mean(data[seq(from = (i-moving_window), to =i)])
  }
  return(result)
}

calc_rolling_avg(data, moving_window = 2)

temp_anomaly_5yr <- calc_rolling_avg(temp_anomaly$No_Smoothing)
temp_anomaly$avg_5_yr = temp_anomaly_5yr

# calculating 10 yr avg 
temp_anomaly_10yr <- calc_rolling_avg(temp_anomaly$No_Smoothing, moving_window = 10)
temp_anomaly$avg_10_yr = temp_anomaly_10yr

plot(No_Smoothing~Year, data=temp_anomaly, type="b")
lines(avg_5_yr~Year, data = temp_anomaly, col = "red", lwd =2)
lines(avg_10_yr~Year, data = temp_anomaly, col = "green", lwd =2)

# if having synchronus change 
# the reference year should be the midpoint 
# endpoint moving averages will always be slow to acurattely represent 