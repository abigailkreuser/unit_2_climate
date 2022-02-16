# 2022 - 02 - 08

# for loop 

vec = c(1, 3, 5, 7)
total = 0 
for(i in seq(length(vec))){
total = total + vec[i]
print(total) # putting this here to see how total changes each time in the loop 
}

#have to use print in the body of a loop
# keep code crucial to loop right above the loop 
# because you have too rerun the initialization commands 
# SO KEEP THEM CLOSE 
# total=0 otherwise we would be adding to where total left off

# NESTED for loops
# i is steeping through rows, j is stepping through columns 

mat = matrix(c(2,0,8,3,5,-4), nrow=2, byrow = TRUE) # automatically makse a mat 3 by 2 because 6 variables  
mat
mat_squared = matrix(NA, nrow = 2, ncol = 3) # make matirx and put NAs in 
mat_squared
for(i in c(1:2)){
  for(j in c(1:3)){
    mat_squared[i,j] = mat[i,j]^2 
  }
  
}

# i will first = 1 and j will first = 1 and then the inner most loop is carried out first
# those values 

#for this to work with any size matrix 
#add dim [1] [2] that is rows and colums 
mat = matrix(c(2,0,8,3,5,-4), nrow=2, byrow = TRUE) # automatically makse a mat 3 by 2 because 6 variables  
mat
mat_squared = matrix(NA, nrow = 2, ncol = 3) # make matirx and put NAs in 
mat_squared
for(i in seq(dim(mat)[1])){
  for(j in seq(dim(mat)[2])){
    mat_squared[i,j] = mat[i,j]^2 
    print(paste("i=",i,"j=",j))
  }
  
}



# while loops

# the loop will keep spinning forever, if the condition is always true
# the code inside must do something to change thte condition to end the loop

#example of a continuous/INFINTIE loop :(
x =1
while(x>0){
  x = x+1
}

#can take a while for R to exit out of the loop 

x = -2
while(x<0){
  x = x+1
}
x


# fishing game! 
rnorm() # norm signals the normal distribution and r signals random 

rnorm(n=1, mean=2, sd=1)
total_catch=0
catch_limit=50 # in lb
n_fish=0

while(total_catch < catch_limit){ # keep fishing!
  n_fish = n_fish + 1 
  fish_weight = rnorm(n=1, mean=2, sd=1)
  total_catch = total_catch + fish_weight
}

# the point of a while loop is that you don't know how many times you are going to 
# iterate but you need to reach a goal. 


