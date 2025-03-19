#https://sites.harding.edu/fmccown/r/


#dot charts


# Let's start with a simple dotchart graphing the autos data:

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat.txt", header=T, sep="\t")

# Create a dotchart for autos
dotchart(t(autos_data))


# Let's make the dotchart a little more colorful:

# Read values from tab-delimited autos.dat
autos_data <- read.table("autos.dat.txt", header=T, sep="\t")

# Create a colored dotchart for autos with smaller labels
dotchart(t(autos_data), color=c("red","blue","darkgreen"),
         main="Dotchart for Autos", cex=0.8)

