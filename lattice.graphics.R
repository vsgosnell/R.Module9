# histogram example
histogram( ~ height | voice.part, data = singer,
           xlab = "Height (inches)", type = "density",
           panel = function(x, ...) {
             panel.histogram(x, ...)
             panel.mathdensity(dmath = dnorm, col = "black",
                               args = list(mean=mean(x),sd=sd(x)))
           } )


# last example with lattice graphics
wireframe(volcano, shade = TRUE, aspect = c(61/87, 0.4), 
          light.source = c(10,0,10))
#plots beautiful 3D image

