#https://sites.harding.edu/fmccown/r/

#histograms

# Let's start with a simple histogram graphing the distribution of the suvs vector:

# Define the suvs vector with 5 values
suvs <- c(4,4,6,6,16)

# Create a histogram for suvs
hist(suvs)


# Let's now read the auto data from the autos.dat data file 
# and plot a histogram of the combined car, truck, and suv data in color.

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat.txt", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, 
           autos_data$suvs)

# Create a histogram for autos in light blue with the y axis
# ranging from 0-10
hist(autos, col="lightblue", ylim=c(0,10))




# Now change the breaks so none of the values are grouped together 
# and flip the y-axis labels horizontally.

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat.txt", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, 
           autos_data$suvs)

# Compute the largest y value used in the autos
max_num <- max(autos)

# Create a histogram for autos with fire colors, set breaks
# so each number is in its own group, make x axis range from
# 0-max_num, disable right-closing of cell intervals, set
# heading, and make y-axis labels horizontal
hist(autos, col=heat.colors(max_num), breaks=max_num, 
     xlim=c(0,max_num), right=F, main="Autos Histogram", las=1)




# Now let's create uneven breaks and graph the probability density.

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat.txt", header=T, sep="\t")

# Concatenate the three vectors
autos <- c(autos_data$cars, autos_data$trucks, 
           autos_data$suvs)

# Compute the largest y value used in the autos
max_num <- max(autos)

# Create uneven breaks
brk <- c(0,3,4,5,6,10,16)

# Create a histogram for autos with fire colors, set uneven
# breaks, make x axis range from 0-max_num, disable right-
# closing of cell intervals, set heading, make y-axis labels 
# horizontal, make axis labels smaller, make areas of each
# column proportional to the count
hist(autos, col=heat.colors(length(brk)), breaks=brk, 
     xlim=c(0,max_num), right=F, main="Probability Density", 
     las=1, cex.axis=0.8, freq=F)

