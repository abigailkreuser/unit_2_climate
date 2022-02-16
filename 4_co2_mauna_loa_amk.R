# 2022-02-03
# AMK

# ERIN GOT ARRESTED!!! 

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 = read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", "n_days", "st_dev_days", "monthly_mean_uncertainty"))


# can go two ways have it downloaded locally, and get it from the internet as well so
# it is the most up to date, but also just incase NASA stops hosting their server



head(co2)
tail(co2)
summary(co2)

# this is the famous Keeling curve 
# from Mauna Loa!!!!! 
# not mucked up with local influences of city smog, and other things. 


# plot it 
plot(monthly_average ~decimal_date, data= co2, type = "l")
lines(deseasonalized ~ decimal_date, data = co2, type = "l", col = "red")

# how are we going to look at the seasonality of the data?? 
co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)


plot(seasonal_cycle ~ decimal_date, data = co2, type = "l")
#the cycle is present up and down, an the widening of the cycle is intriuging 

co2_2016to2021 = co2[co2$decimal_date>2016, ]
plot(seasonal_cycle~decimal_date, data = co2_2016to2021, type = "l")


#dont have to create a variable if its on the fly you can just put in the subseted data

plot(seasonal_cycle~decimal_date, data = co2[co2$decimal_date>2016, ], type = "l")


jan_anomaly = mean(co2$seasonal_cycle[co2$month == 1])
jan_anomaly
# the amount of Co2 in the atmoshpere is 0.099 above the average
 

# new df the "painful way" to get means 
co2_monthly_cycle = data.frame(month = seq(12), detrended_monthly_cycle=NA )
head(co2_monthly_cycle)


# fill in the data for our monthly mean anomalies 
co2_monthly_cycle$detrended_monthly_cycle[1]=mean(co2$seasonal_cycle[co2$month == 1])
co2_monthly_cycle$detrended_monthly_cycle[2]=mean(co2$seasonal_cycle[co2$month == 2])
co2_monthly_cycle$detrended_monthly_cycle[3]=mean(co2$seasonal_cycle[co2$month == 3])
co2_monthly_cycle$detrended_monthly_cycle[4]=mean(co2$seasonal_cycle[co2$month == 4])
co2_monthly_cycle$detrended_monthly_cycle[5]=mean(co2$seasonal_cycle[co2$month == 5])
co2_monthly_cycle$detrended_monthly_cycle[6]=mean(co2$seasonal_cycle[co2$month == 6])
co2_monthly_cycle$detrended_monthly_cycle[7]=mean(co2$seasonal_cycle[co2$month == 7])
co2_monthly_cycle$detrended_monthly_cycle[8]=mean(co2$seasonal_cycle[co2$month == 8])
co2_monthly_cycle$detrended_monthly_cycle[9]=mean(co2$seasonal_cycle[co2$month == 9])
co2_monthly_cycle$detrended_monthly_cycle[10]=mean(co2$seasonal_cycle[co2$month == 10])
co2_monthly_cycle$detrended_monthly_cycle[11]=mean(co2$seasonal_cycle[co2$month == 12])
co2_monthly_cycle$detrended_monthly_cycle[12]=mean(co2$seasonal_cycle[co2$month == 12])


print(co2_monthly_cycle)
plot(detrended_monthly_cycle ~ month, data = co2_monthly_cycle, type = "l")

# following the NDVI curve with the massive ammount of plants bringing in co2 
# in the northern hemisphere where the most land mass is on the globe. 

# Exercise to do at home!! with 1959 and 2021 data


### FOR LOOPS!!! 
# loops can scare new programers 
# WTF time did i tell Maggie...??



for(i in c(1:4)){
  print("one run of my loop")
}

#i is an ITERAND and it is iterated throughout the loop 
for(i in c(1:4)){
  print(i)
}


#your iterand is the last value of where it ended 
# helps show you where your loop brokedown 
# then can assess where the bug is from there 


words = c("my", "second", "for", "loop")
for(word in words){
  print(word)
}

#it will iterate over whater you want it to iterate over 

# most commonly used for indexing 
my_vector = c(1,3,5,2,4)
n = length(my_vector) # because it is a vector use length, if df or matix use dim
n
my_vector_squared = rep(NA, n) # can be helpful to know how long your new vector needs to be 
my_vector_squared

for(i in seq(n)){
  my_vector_squared[i] = my_vector[i]^2
}

cbind(my_vector, my_vector_squared)



#Exercise 5.1

#for loop to calculate the factorial of any interger larger than 0 
num = 6

for (i in num){
  factorial(i)
}

#WRONG
for (i in num){
  fact = i*(i-1):1 
  print(fact)
  sum(fact)
}

for(i in num){
  factorial = factorial*i
  print(factorial)
}


