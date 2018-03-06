## Load libraries a
setwd("C:/Users/dl0ck/OneDrive/Documents/Spring 2018/Applied Statistical Programming/git/Week 8/PS5/") #This will need to be changed to match your directory

library(devtools)
library(roxygen2)

## This is run once when the package strcuture is first created


## At this point put the *.R files into the correcto directories and edit the DESCRIPTION file
current.code<-as.package("integrateIt")
load_all(current.code)
document(current.code)
check(current.code)


install(pkg=current.code, local=TRUE)
build(current.code, path=getwd())


printTrapezoid
getMethod(printTrapezoid, "Trapezoid")

printSimpson
getmethod(printTrapezoid, "Simpson")

## View of function
integrateIt


## Potential errors
# x must be a numeric vector
x1 <- c("h","j","k")
integrateIt(x1,y,"Trap")

# y must be a numeric vector
y1 <- c("a","b","c")
integrateIt(x,y1, "Trap")

# x and y must be of the same length
x2 <- c(1,2,3)
y2 <- c(4,5)
bound<-c(1,3)
integrateIt(x2,y2, bound, "Simpson")

# rule must be either 'Trap' or 'Simpson'
integrateIt(x,y, "neither")


## Example of a more difficult function to integrate
x3 <- (1:10)
y3 <- exp(-x^2)
integrateIt(x3, y3, "Trap")
integrateIt(x3, y3, "Simpson") # not necessarily the same as when using "Trap"

## Print methods yield just the area
print(integrateIt(x3, y3, "Trap"))
print(integrateIt(x3, y3, "Simpson"))
