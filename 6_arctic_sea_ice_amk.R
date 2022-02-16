# 2022- 02 - 08

#arctic sea ice 


# arctic_ice = read.csv("data/N_seaice_extent_daily_v3.0.csv", skip=2, header = FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, skip=2, sep=",", header=FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))

head(arctic_ice)
tail(arctic_ice)
# from head we can see that the date is not in the nice decimal date 
# we need to change that and we are going to use a package 

library("lubridate")
arctic_ice$date = make_date(year = arctic_ice$Year, month = arctic_ice$Month, day = arctic_ice$Day)
head(arctic_ice)

#date format 1978-11-05 

plot(Extent~date, data = arctic_ice, type = "l")

# ploting the annual average of each year 

arctic_ice_averages = data.frame(year = seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1), 
                                 extent_annual_avg = NA, extent_5yr_avg = NA)

head(arctic_ice_averages)  

#now create a for loop to calculate these variables

mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$year[1]])

#work inside out and have the internal code work and relate to my other data frame!! !
# now i can replace the 1 with i 


for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$year[i]])
}

head(arctic_ice_averages)


#clean up add everything right next to eachother 
  
arctic_ice_averages = data.frame(year = seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1), 
                                 extent_annual_avg = NA, extent_5yr_avg = NA)
for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$year[i]])
}
head(arctic_ice_averages)                               



# calculate the 5 yr avg 
# erin likes the 2 before and 2 after
i=1
for(i in seq(dim(arctic_ice_averages)[1])){
  years= seq(from = (arctic_ice_averages$year[i]-2), to = (arctic_ice_averages$year[i]+2))
  arctic_ice_averages$extent_5yr_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
}
# %in%  this is saying it must be in our new vector years and then it will calculate that average 
# need to change the sequence so that our 5 year avgs at the begining and the end are not junk


# plot the moving averages 
plot(extent_annual_avg ~ year, data = arctic_ice_averages, type = "l")
lines(extent_5yr_avg ~ year, data = arctic_ice_averages, type = "l", col= "red")


#with seasonal data

arctic_ice_averages$date = make_date(year=arctic_ice_averages$year)

pdf(file = "figures/arctice_sea_ice_averages.pdf", width=7, height=5.5)
plot(Extent ~date, data = arctic_ice, type= "l")
lines(extent_annual_avg ~ date, data = arctic_ice_averages, type = "l")
lines(extent_5yr_avg ~ date, data = arctic_ice_averages, type = "l", col= "red")
dev.off()

# doesn't plot together at first because date in og data is a DATE not a numeric
# use lubridate to change year to a date file 

#Exercise 6.1
