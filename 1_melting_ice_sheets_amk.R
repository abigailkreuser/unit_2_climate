# AMK
# 2022-01-27

# ice mass loss bring in the data
# read.table is local to our repo

ant_ice_loss = read.table(file = "data/antarctica_mass_200204_202111.txt",
                          skip = 31, sep = "", header = FALSE, col.names = c("decimal_date",
                                                                             "mass_Gt", "sigma_Gt"))
head(ant_ice_loss)
tail(ant_ice_loss)

grn_ice_loss = read.table(file = "data/greenland_mass_200204_202111.txt",
                          skip = 31, sep = "", header = FALSE, col.names = c("decimal_date",  "mass_Gt", "sigma_Gt"))
                                                                             
head(grn_ice_loss)
tail(grn_ice_loss)
dim(grn_ice_loss)
summary(grn_ice_loss)



# visualize :) this is r notation y~x is y as a funtion of x

plot(mass_Gt~decimal_date, data = ant_ice_loss, type = "l", ylim= c(grn_min,0))

lines(mass_Gt~decimal_date, data = grn_ice_loss, col = "red")

# plot window is defined by the first command, so currently the greenland data does not fit.
# so add ylim

grn_min = min(grn_ice_loss$mass_Gt) #use this variable to avoid hard coding, now its more versitile for updating data
# or could do ylim = range(grn_ice_loss$mass_Gt)

plot(mass_Gt~decimal_date, data = ant_ice_loss, type = "l", ylim= range(grn_ice_loss$mass_Gt))
lines(mass_Gt~decimal_date, data = grn_ice_loss, col = "red")


# default plot is in points so use type = "l" for lines 
# adding another layer of data just use points() or lines()

# Now how to take the line out when GRACE was not running 
# we are going to add some NAs to help ourselves in the future as well

# Acountinng for gap between missions 
data_break = data.frame(decimal_date = 2018, mass_Gt = NA, sigma_Gt = NA)
data_break

ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
tail(ant_ice_loss_with_NA)

#r ADDED IT AT THE END, SO we need it in the right spot otherwise the plot will not change 

order(ant_ice_loss_with_NA$decimal_date) #204 the index number of our NA was plopped inbetween 163 and 164

ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date), ]
#using the brackets to access the data- and then , with a space so all columns are given 

plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type ="l")
#### REPEAT WITH GRNLAND DATA

### 2022-02-01
# I did not do my hw ^^ like adding greenland data

grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)
tail(grn_ice_loss_with_NA)

order(grn_ice_loss_with_NA$decimal_date)

grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date), ]


plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type ="l", ylim= range(grn_ice_loss$mass_Gt))
lines(mass_Gt~decimal_date, data=grn_ice_loss_with_NA, col ="red")


#plot the uncertainty 
head(ant_ice_loss_with_NA)
pdf('figures/ice_mass_trends.pdf', width = 7, height = 5 )
plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type ="l", ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE),
     ylab = "Ice mass loss (Gt)", xlab = "year")
lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed')
lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') 

# add grnland
lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='red', lwd=2) 
lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed', col="red") 
lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed', col="red") 
dev.off()

# Bar plot showing rate of ice mass loss 
# getting into data analysis 

min(ant_ice_loss_with_NA, na.rm = TRUE)
min(grn_ice_loss_with_NA, na.rm = TRUE)

barplot(height=c(min(ant_ice_loss_with_NA, na.rm = TRUE), 
                 min(grn_ice_loss_with_NA, na.rm = TRUE)))

# this give a graph in the negative dim so multiply it all by negative 1
barplot(height=-1*c(min(ant_ice_loss_with_NA, na.rm = TRUE), 
                 min(grn_ice_loss_with_NA, na.rm = TRUE)),
        names.arg = c("Antartica", "Greenland"))

#NEED TO SAVE TO FIGURES 

#exercise calculate the average annual ice loss 

head(ant_ice_loss_with_NA)

ant_total_time = range(ant_ice_loss_with_NA$decimal_date)[2] - range(ant_ice_loss_with_NA$decimal_date)[1]
grn_total_time = range(grn_ice_loss_with_NA$decimal_date)[2] - range(grn_ice_loss_with_NA$decimal_date)[1]

ant_total_time
rate_ant_total
rate_grn_total


rate_ant_total = ant_ice_loss_with_NA, na.rm = TRUE)/ant_total_time
rate_grn_total = min(grn_ice_loss_with_NA, na.rm = TRUE)/grn_total_time

pdf('figures/ice_mass_rate.pdf', height = 5  )
barplot(height=-1*c(rate_ant_total, 
                    rate_grn_total),
        names.arg = c("Antartica", "Greenland"), ylim = c(0, 400), ylab = "Rate of Ice loss Gt/year")
dev.off()
