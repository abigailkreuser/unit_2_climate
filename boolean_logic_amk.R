# boolean logic 2022-02-01

vec = c(1, 0, 2, 1)
vec[c(F, T, T, F)]


# Operator Syntax Tests

a > b #Is a greater than b?
a >= b # Is a greater than or equal to b?
a < b # Is a less than b?
a <= b # Is a less than or equal to b?
a == b # Is a equal to b?
a != b # Is a not equal to b?
a %in% c(a, b, c) # Is a in the group c(a, b, c)? 

# helpful for subsetting data 

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
head(world_oceans)

world_oceans$avg_depth_m > 4000 # test condition 
# returns a vector of logical values 


# to use this condition to subset
world_oceans[world_oceans$avg_depth_m > 4000, ] # this returns all rows that meet this condition

world_oceans[world_oceans$avg_depth_m > 4000,"oceans" ] 

#More realistic

world_oceans$ocean[world_oceans$avg_depth_m > 4000] # can specify the column inside or outside 

sum(c(1,2,3))
sum(world_oceans$avg_depth_m > 4000)


#sometimes you do not get what you expect in small numbers 

3 == 1+2 #TRUE
0.3 == (0.1 + 0.2) # FALSE - medium article fun to read!! 
0.3 - (0.1 + 0.2)


error_threshold = 0.0000001
# if within the thresh then tell me TRUE

abs(0.3 - (0.1+0.2)) < error_threshold
# to keep in the back of your mind the numbers are stored in binary on computers 
# so math may be a little misleading 


### Boolean operators 
# &, | (or), xor (neverused by erin), !- false?, any, all

world_oceans[world_oceans$avg_depth_m<4000 & world_oceans$area_km2<50e6, ]


vec = c(1,2,3,NA)
vec == NA # r does not like NAs
is.na(vec)


any(is.na(vec))
all(is.na(vec))


# try out TRY TRY TRY exercises in tutorial 



