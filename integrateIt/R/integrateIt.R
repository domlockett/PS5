setwd("C:/Users/Dominique/OneDrive/Documents/Spring 2018/Applied Statistical Programming/git/Week 8/PS5")
setGeneric(name="integrateIt",
           def=function(x, y, bounds, rule)
           {standardGeneric("integrateIt")}
)

setMethod(f="integrateIt",
          definition=function(x,y,bounds=c(a,b),rule){
            x<-as.matrix(x)
            x<-t(x)
            y<-as.matrix(y)
            y<-t(y)
            if (rule=="trap"){
              trap<-y*2
              trap[1]<-y[1]
              trap[ncol(y)]<-y[ncol(y)]
              h<-(bounds[2]-bounds[1]+1)/ncol(x)
              trapintegr<-h/2*(trap)
              x<-as.vector(x)
              y<-as.vector(y)
              return(new("Trapezoid", result=sum(trapintegr), x = x, y = y))
            }
            if (rule=="simp"){
              simp<-y
              for (i in 1:ncol(y)){
                if((i %% 2) == 0){
                  simp[i]<-y[i]*4} 
                else {simp[i]<-y[i]*2}}
              simp[1]<-y[1]
              simp[ncol(y)]<-y[ncol(y)]
              h<-(bounds[2]-bounds[1]+1)/ncol(x)
              simpintegr<-h/3*(simp)
              x<-as.vector(x)
              y<-as.vector(y)
              return(new("Simpson", result=sum(simpintegr), x = x, y = y))}
          }
)
x<-c(0:10)
y<-seq(0,20,2)
integrateIt(x,y,bounds=c(0,10), rule="trap")
integrateIt(x,y,bounds=c(0,10), rule="simp")

library(devtools)
library(roxygen2)
## This is run once when the package strcuture is first created


## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)