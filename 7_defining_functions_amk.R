# 02-10-2022
# user defined functions 

# Erin likes making fxns for visualizations 
# if having to make or copy and paste more than three times 
# and also helpul if just need to tweak minor things 

vec = c(1,3,5,7)

avg <- function(x){
  sum(x)/length(x)
}


avg(vec)


# not shorthand more explicit 
avg <- function(x){
  sum_x = sum(x)
  length_x = length(x) 
  avg = sum_x/length_x
  return(avg)
  
}

my_result = avg(vec)
my_result


#if you have a complex function, with if else may need multiple return statements 

avg()
# throws an err

# add geometric means to a function 
# typicaly we think of aritmetic mean 


avg <- function(x, arithmetic = TRUE){
  length_x = length(x)
  result = ifelse(arithmetic, sum(x)/length_x, prod(x)^(1/length_x)) # remember the condition of the ifelse statement 
  return(result)
  
}


avg(vec) # takes arithmetic mean 
avg(vec, arithmetic = FALSE) # takes geometric mean 

# parameters are optional if they have a default variable in there -- arithmetic
# x parameter is required
avg(vec, FALSE)  # paytention!! the order you list matters
avg(FALSE, vec) # unexpected values 
avg(arithmetic = FALSE, x = vec) # if im explicit I don't have to paytention to order
# good coding is explicit with parameters 

# this code was written casually, if passing along need to make it more user friendly 
# make it shareable? dont want it to falsely propogate 


avg <- function(x, arithmetic = TRUE){
  if(!is.numeric((x))){stop("avg() failed. x must be numeric.")}
  length_x = length(x)
  result = ifelse(arithmetic, sum(x)/length_x, prod(x)^(1/length_x)) # remember the condition of the ifelse statement 
  return(result)
  
}

avg(FALSE)


# if quite ambitious we could build a package 


# exercise 7.1 
x = 79
x = 99
grade <- function(x){
  if(!is.numeric(x)){stop("numeric value needed")}
  if(x >= 90){
    return("A")
  }
  if(x >= 80){
    return("B")
  }
  if(x >= 70){
    return("C")
  }
  if(x >= 60){
    return("D")
  }
  if(x <= 60){
    return("F")
  }
  
}

x
A
grade(x)
