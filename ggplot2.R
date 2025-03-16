# ggplot2
# The basic notion is that there is a grammar to the composition of graphical components in statistical graphics. 
# Each component is added to the plot as a layer – something that never been done in statistical programming language. 

# In the Grammar of Graphics, a scale controls the mapping from a variable in the data to an aesthetic. 
# In ggplot, we often use the color filling scale be determined automatically. 
# But to use our custom color scheme, we need to take control of the mapping of the variable to fill color in geom_point().

#example

#install tidyverse package -> contains ggplot2
install.packages("tidyverse")
#load library
library(tidyverse)

p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
p

p + geom_vline(xintercept = 5)


#another example
df <- data.frame(x = 1:10 , y = 1:10)
f <- ggplot(df, aes(x = x, y = y))
f + geom_line(linetype = 2)
# Line types should be specified with either an integer, a name, or with a string of
# an even number (up to eight) of hexidecimal digits which give the lengths in
# consecutive positions in the string.
# 0 = blank, 1 = solid, 2 = dashed, 3 = dotted, 4 = dotdash, 5 = longdash, 6 = twodash




#ggplot2 and maps

library(ggplot2)

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
library(reshape2) # for melt
crimesm <- melt(crimes, id = 1)


#find out where libraries are being installed in R
.libPaths()

#download maps library
install.packages("maps", repos="https://cloud.r-project.org/")

#load maps library according to location found in .libPaths()
library(maps, lib.loc="/Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/library")



if (require(maps)) {
  states_map <- map_data("state")
  ggplot(crimes, aes(map_id = state)) +
       geom_map(aes(fill = Murder), map = states_map) +
       expand_limits(x = states_map$long, y = states_map$lat)
  last_plot() + coord_map()
  ggplot(crimesm, aes(map_id = state)) +
       geom_map(aes(fill = value), map = states_map) +
       expand_limits(x = states_map$long, y = states_map$lat) +
       facet_wrap( ~ variable)
}
#getting errors for this code




#ChatGPT fix:

# Load required libraries
if (!require(ggplot2)) install.packages("ggplot2", repos="https://cloud.r-project.org/")
if (!require(maps)) install.packages("maps", repos="https://cloud.r-project.org/")

library(ggplot2)
library(maps)

# Get US states map data
states_map <- map_data("state")

# Example: Dummy crimes dataset (Ensure your dataset exists)
# crimes <- data.frame(state = tolower(state.name), Murder = runif(50, 0, 10))

# Plot 1: Crime data map
ggplot(crimes, aes(map_id = state)) +
  geom_map(aes(fill = Murder), map = states_map) +
  expand_limits(x = states_map$long, y = states_map$lat) +
  coord_map()

# Plot 2: Facet map for different crime variables
ggplot(crimesm, aes(map_id = state)) +
  geom_map(aes(fill = value), map = states_map) +
  expand_limits(x = states_map$long, y = states_map$lat) +
  facet_wrap(~ variable) +
  coord_map()
