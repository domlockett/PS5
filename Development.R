setwd("C:/Users/Dominique/OneDrive/Documents/Spring 2018/Applied Statistical Programming/git/Week 8/PS5/") #This will need to be changed to match your directory
library(devtools)
library(roxygen2)
## This is run once when the package strcuture is first created


## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)
