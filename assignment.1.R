
#install dataset
data(economics)
#error

#need to load ggplot2 to use the economics dataset
install.packages("ggplot2")
library(ggplot2)

#access the dataset directly from ggplot
head(ggplot2::economics)

#assign the dataset to a variable
economics <- ggplot2::economics
head(economics)  # View the first few rows

#plot unemployment trends over time using plot() from base graphics
plot(economics$date, economics$unemploy, type="l", #economics$date -> x axis is time
                                                   #economics$unemploy -> y axis is # of unemployed people
                                                   #type="l" specifies a line plot instead of points
     col="blue", lwd=2, #col=blue -> colors line blue
                        #lwd=2 -> sets line width to make it thicker 
     main="US Unemployment Over Time", #main title
     xlab="Year", ylab="Number of Unemployed") #x an y axis labels


#plot population size vs unemployment using xyplot() with lattice

#install and load lattice
install.packages("lattice")
library(lattice)

xyplot(unemploy ~ pop, data=economics, #unemploy ~ pop -> formula notation: y ~ x -> plot unemploy (y) against pop (x)
                                       #data=economics -> uses economics dataset
       main="Unemployment vs Population", #main title
       xlab="Total Population", #x axis label
       ylab="Number of Unemployed", #y axis label
       col="red", pch=16) #colors points red, pch=16 sets point shape to solid circles




#plot savings rates trends over time using ggplot and geomline from ggplot2

ggplot(economics, aes(x=date, y=psavert)) + #starts a ggplot object with economics dataset 
                                            #aes... maps date (x axis) to personal savings rate (y axis)
  geom_line(color="darkgreen", size=1) +   #geom line -> creates line plot, colors it dark green, sets line thickness
  labs(title="US Personal Savings Rate Over Time", #adds main title + x and y axis labels
       x="Year",
       y="Savings Rate (%)") +
  theme_minimal() #applies minimalistic theme

