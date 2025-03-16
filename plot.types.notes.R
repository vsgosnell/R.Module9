# plot() is most basic command used to produce a plot
# first 2 arguments are x and y coordinates
# if only one vector provided, it is taken as the y coordinate
# and is plotted against the index values of the vector
# 
# Plot Types:
# There are 9 basic ways for R to plot a set of points. 
# To use one of these, define the type argument one of these ways:
# p: points (this is the default)
# l: a line
# b: "both", points connected by line segments
# c: just the connecting segments of "b"
# o: "overplotted", points and lines overplotted
# h: a histogram
# s: stair
# S: alternative stairs
# n: none

# see OneNote R Visualization for more details and images

# There are 25 different plotting points that can be used by defining the argument pch 
# Points 21 thru 25 are multi-color points. 
# Define the fill color for these with bg (which stands for "background").

# There are 6 line types you can use by defining lty with 1 thru 6.

# To control the size of plotted points, give the argument cex 
# (for character expansion) a value x, which will multiply the size of the character x times.

# R has 8 default system colors, which can be assigned 
# to a point or line by passing a numeric value of 1:8 to col
# However, R has 657 named colors you can call upon by passing 
# the name of the color to col. 
# To see all the names, type colors()

