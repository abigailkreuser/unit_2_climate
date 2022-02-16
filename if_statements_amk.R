# if statements

num = -2

if(num<0){
  num = num *-1
  
}

num
# now num is positive 2 


# a nice way to deal with these is use messages 
num = -2

if(num<0){
  print("crap num is negative!!")
  num = num *-1
  print(" I turned num into a positive number")
}

num
num
# HELPFUL FOR DEBUGGING CODE AND SENDING MESSAGES WHEN THINGS ARE BROKENA ND FIXED 

if(num<0){
  print("crap num is negative!!")
  num = num *-1
  print(" I turned num into a positive number")
} else{
  print("dont worry num is positive")
}

#Exercise 3.1
temp = 98.4
temp = 102.1
#option to not code 98.6 but put something like avg_temp as a variable outsde the statement 


if (temp <= 98.6){
  print("no fever, no worries")
}else{
  print("yes, its fever")
  dif = temp - 98.6
  print(dif)
  if(temp > 101){
    print("oh thats high..")
  }
}

### If else and else if
a = 70
b = 70


# as simple as this code is ... agressively test your code. 
if(a>b){
  print("a won!")
} else if(a<b){
  print("b won!")
} else{
  print("it was a tie!")
}


# the ifelse() function 
# can make your code prettier and you only use it in certain examples
a= c(13, 0, -6, 4)

ifelse(test, yes, no)
reciprocal = ifelse(a != 0, 1/a, NA ) 
reciprocal

my_data = cbind(a, reciprocal)
my_data
