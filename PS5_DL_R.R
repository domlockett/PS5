install.packages("devtools")
library(devtools)

setClass(Class="Trapezoid",
           representation = representation(
           x = "numeric",
           y = "numeric",
           dx= "numeric"
         ),
         prototype = prototype(
           
           x = numeric(),
           y = numeric(),
           dx=numeric()
         )
)

#setValidity("Trapezoid", function(object){
  if(object@number %in% c(1,2,3)){
    return(TRUE)
  } else { # if not
    return("Input is not a valid value. The number should be between 1 and 3.") # it returns the message that asks to input the number between 1 and 3.
  }
})




setClass(Class="Simpson",
         representation = representation(
           x = "numeric",
           y = "numeric",
           dx= "numeric"
         ),
         prototype = prototype(
           
           x = numeric(),
           y = numeric(),
           dx=numeric()
         )
)

setGeneric("integrateIt",
           def=function(object){
             standardGeneric("integret")
           })

setMethod (f="integrateIt",  definition=function(object){
  integrateIt <- function(x, y, class) {
    a<-min(x)
    b<-max(y)
    if (class == "Trapezoid") {
      h <- b - a
      
      trap_fxdx <- (h / 2) * (f(a) + f(b))
      out1 <-new("Trapezoid", x=, y=, class=)
      return(out1)
    } else {
      h <- (b - a) / 2
      x0 <- a
      x1 <- a + h
      x2 <- b
      
      simp_fxdx <- (h / 3) * (f(x0) + 4 * f(x1) + f(x2))
      return(simp_fxdx)
      out2 <-new("Simpson", x=, y=, class=)
      
    }}})
  
integrateIt <- function(x, y, f){
h <- (b - a) / 2
x0 <- a
x1 <- a + h
x2 <- b

simp_fxdx <- (h / 3) * (f(x0) + 4 * f(x1) + f(x2))
return(simp_fxdx)}

integrateIt(f,0, pi/4)



# make generic print methods for seperate clsas


#make a function


