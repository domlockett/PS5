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
      trap <- (h / 2) * (f(a) + f(b))
    
      x<-as.vector(x)
      y<-as.vector(y)
      return(new("Trapezoid",result=(trap), x=, y=, class=)
    } else {
      h <- (b - a) / 2
      x0 <- a
      x1 <- a + h
      x2 <- b
      
      simp_fxdx <- (h / 3) * (f(x0) + 4 * f(x1) + f(x2))
      return(new("Simpson", x=, y=, class=))
      out2 <-
      
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
a<-c(1:10)
b<-seq(2,20,2)
#make a function
integrateIt <- function(fun, a, b, rule) {
  if (rule=="Trap"){
  # numerical integral of fun from a to b
  # using the trapezoid rule with n subdivisions
  # assume a < b and n is a positive integer
  h <- (b-a)/n
  x <- seq(a, b, by=h)
  y <- fun(x)
  t <- h * (y[1]/2 + sum(y[2:n]) + y[n+1]/2)
  return(new("Trapezoid",result=t, a=, b=, class=))
} else {
  # numerical integral using Simpson's rule
  # assume a < b and n is an even positive integer
  h <- (b-a)/n
  x <- seq(a, b, by=h)
  if (n == 2) {
    s <- fun(x[1]) + 4*fun(x[2]) +fun(x[3])
  } else {
    s <- fun(x[1]) + fun(x[n+1]) + 2*sum(fun(x[seq(2,n,by=2)])) + 4 *sum(fun(x[seq(3,n-1, by=2)]))
  }
  s <- s*h/3
  return(new("Simpson", result=s, a = a, b = b))
}
}
integrateIt(a,b, rule="Trap")





but<-integrateIt(x,y,"Trap")
