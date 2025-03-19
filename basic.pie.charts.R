#https://sites.harding.edu/fmccown/r/


#pie charts


# Let's start with a simple pie chart graphing the cars vector:

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart for cars
pie(cars)


# Now let's add a heading, change the colors, 
# and define our own labels:

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Create a pie chart with defined heading and
# custom colors and labels
pie(cars, main="Cars", col=rainbow(length(cars)),
    labels=c("Mon","Tue","Wed","Thu","Fri"))



# Now let's change the colors, label using percentages, 
# and create a legend:

# Define cars vector with 5 values
cars <- c(1, 3, 6, 4, 9)

# Define some colors ideal for black & white print
colors <- c("white","grey70","grey90","grey50","black")

# Calculate the percentage for each day, rounded to one decimal place
car_labels <- round(cars/sum(cars) * 100, 1)

# Concatenate a '%' char after each value
car_labels <- paste(car_labels, "%", sep="")

# Create a pie chart with defined heading and custom colors and labels
pie(cars, main="Cars", col=colors, labels=car_labels,
    cex=0.8)

# Create a legend at the right   
legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, 
       fill=colors)

