# https://www.stat.ubc.ca/~jenny/STAT545A/block09_xyplotLattice.html


# Scatterplots with lattice

#load the data
## data import from URL
gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
gDat <- read.delim(file = gdURL)


# Basic sanity check that the import has gone well:
str(gDat)


# Drop Oceania, which only has two countries
jDat <- droplevels(subset(gDat, continent != "Oceania"))
str(jDat)


#load the lattice package
library(lattice)


# Get a scatterplot with xyplot(). 
# Background grids are nice. 
# In addition to grid = TRUE, grid = "h" and grid = "v" are other useful shortcuts.

xyplot(lifeExp ~ gdpPercap, jDat)
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE)


# Clearly we need to log transform the horizontal axis, 
# i.e. the one for GDP per capita. 
# You can take the logarithm directly in the formula, 
# but it's sub-optimal due to the axis tick labels, 
# which are not so easy to read. 
# It's better to request the log transform via the scales = argument.

## log, the sub-optimal way
xyplot(lifeExp ~ log10(gdpPercap), jDat,
       grid = TRUE)
## logging, better way ... step 1
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10)))




# The next easiest thing is to specify equispaced.log = FALSE 
# Even more is possible with functions in the latticeExtra package

xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)))




# The type = argument can be used to enhance the figure with data-responsive elements. 
# first, we specify the default value type = "p", which requests only points, 
# and second, we request a simple linear regression with type = c("p", "r").

xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = "p")
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "r"))



# Let's make line that more obnoxious and more orange. 
# And let's try a different overlay -- namely, a smooth regression 
# via type = c("p", "smooth"). In this case the difference is pretty subtle.

xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "r"), col.line = "darkorange", lwd = 3)
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "smooth"), col.line = "darkorange", lwd = 3)



# If you specify a grouping variable via group =, 
# the data from the various groups will be superposed 
# and visually distinguished. A simple key is obtained with auto.key = TRUE, 
# but there are many alternative ways to customize the key. 

xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       group = continent)

## auto.key
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       group = continent, auto.key = TRUE)


# The group = argument can be used together with the type = argument.

## groups + type "smooth"
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       group = continent, auto.key = TRUE,
       type = c("p", "smooth"), lwd = 4)
## making key more compact
xyplot(lifeExp ~ gdpPercap, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       group = continent, auto.key = list(columns = nlevels(jDat$continent)),
       type = c("p", "smooth"), lwd = 4)



# If you would rather see data for different groups in separate panels, 
# instead of superposed, specify the grouping factor z like so: y ~ x | z. 
# This is called multi-panel conditioning.

xyplot(lifeExp ~ gdpPercap | continent, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)))

xyplot(lifeExp ~ gdpPercap | continent, jDat,
       group = continent,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)))



# You can use conditioning, grouping, and type = in various combinations.

## conditioning + type "r" or "smooth"
xyplot(lifeExp ~ gdpPercap | continent, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "smooth"), col.line = "darkorange", lwd = 4)
xyplot(lifeExp ~ gdpPercap | continent, jDat,
       grid = TRUE, group = continent,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "smooth"), lwd = 4)




#combat overplotting

# In a univariate setting, we fought overplotting with jitter, 
# before we turned to entirely different strategies, 
# such as the kernel density estimation that underpins densityplot(). 
# In scatterplots, the entry level solution to overplotting is to use 
# alpha transparency for the points. I do that first via alpha = 1/2. 
# Here's how to think of this: if alpha transparency is set to \(1/k\),
# then an area becomes opaque when \(k\) points overlap. 
# (My lattice default specifies pch = 16, if you want to specify that in your call. 
# Warning: not all graphics devices support alpha transparency.)

xyplot(lifeExp ~ gdpPercap | continent, jDat,
       grid = TRUE, 
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       type = c("p", "smooth"), lwd = 4, alpha = 1/2)
xyplot(lifeExp ~ gdpPercap | continent, jDat,
       grid = TRUE,
       scales = list(x = list(log = 10, equispaced.log = FALSE)),
       panel = panel.smoothScatter)




# hexagonal binning

# Finally, hexagonal binning is an interesting way to handle overplotting. 
# The plane is divided into a hexagonal lattice and the individual hexagons are shaded 
# according to the number of point that fall within. This requires an add-on library 
# hexbin which you will need to install. Then you can use hexbinplo() as almost a drop-in substitute for xyplot().

install.packages("hexbin")

#install.packages("hexbin", dependencies = TRUE)
library(hexbin)
hexbinplot(lifeExp ~ gdpPercap, jDat,
           scales = list(x = list(log = 10, equispaced.log = FALSE)),
           aspect = 1, bins=50)

