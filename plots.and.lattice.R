# building up plots

cars <- c(1, 3, 6, 4, 9)
plot(cars)

plot(cars, type = 'o', col = 'blue')
title(main = "Autos", col.main = 'red', font.main = 4)

#problems with plot:
# awkward workflow -> adding elements manually one by one
# no built-in support for encoding additional information

#lattice package
# High-level lattice functions do not actually print or plot anything. 
# They create an object of class "trellis", which can be printed or plotted.
# Lattice graphics are very customizable, 
# but par() settings have no effect.

# advantages of lattice package:
# multi-panel conditioning: puts many scatterplots on one page
# conveying additional information: groups arg coupled with auto.key = TRUE 
# allows you to visually distinguish color or line type, etc.
# adding useful data summaries: linear fit or smoother -> the type argument is powerful

#install the lattice package and load the library
install.packages("lattice")
library(lattice)

xyplot(lat~long, data = quakes, pch = ".")
# database is called quakes and incorporates a number of fields, 
# including the latitude (lat) and longitude (long) of the individual quakes. 
# The quakes are plotted at their locations using a small dot ("."). 
# The locations are passed to xyplot using a formula (lat~long), 
# with lat being the x coordinate and long the y coordinate. 
# A scatterplot is generated (xyplot) and automatically printed.

#can also use this command to do the same thing:
tplot <- xyplot(lat~long, data = quakes, pch =".")
print(tplot)

