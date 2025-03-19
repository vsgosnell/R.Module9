#https://sites.harding.edu/fmccown/r/

#histograms

# In this example we'll plot the distribution of 1000 
# random values that have the log-normal distribution.


# Get a random log-normal distribution
r <- rlnorm(1000)

hist(r)


# Since log-normal distributions normally look better 
# with log-log axes, let's use the plot function with 
# points to show the distribution.

# Get a random log-normal distribution
r <- rlnorm(1000)

# Get the distribution without plotting it using tighter breaks
h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))

# Plot the distribution using log scale on both axes, and use blue points
plot(h$counts, log="xy", pch=20, col="blue",
     main="Log-normal distribution",
     xlab="Value", ylab="Frequency")

