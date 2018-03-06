#' Integrating values
#'
#' Finds the Integrated value of vectors
#'
#' @param fun A numeric object
#' @param tolerance A numeric object with the same dimensionality as \code{x}.
#' @param rule A numeric object with the same dimensionality as \code{x}.
#' @param start A numeric object with the same dimensionality as \code{x}.
#' @param correct A numeric object with the same dimensionality as \code{x}.

#'
#' @return An object of class Trapezoid or Simpson containing
#'  \item{bounds}{The integral of the x and y values}
#'  \item{x}{The first object input} 
#'  \item{y}{The second object input}
#'  \item{trap}
#'  \item{simp}
#' @author Dominique M. Lockett
#' @note This is not a very simple function
#' @examples
#' 
#' x<-seq(1,11,1)
#'y<-seq(11,21,1)
#'bounds<-c(1,10)
#'rule<-"Trap"
#'integrateIt(x, y, bounds, rule)
#' integrateIt(x,y,bounds, rule=)
#' @seealso 
#' @rdname integrateIt
#' @aliases integrateIt,ANY-method
#' @export
setGeneric(name="tolTest",
           def=function(fun, tolerance,rule, start,correct, ...)
           {standardGeneric("tolTest")}
)


setMethod(f="tolTest",
          definition=function(fun, tolerance, rule, start, correct, ...){
            begin<-start[1]
            if (rule=="Trap"){
              i<-1
              repeat{
                n<-begin+i
                h <- (7-5) / n
                j <- 1:n - 1
                xj <- start[1] + j * h
                trap <- (h / 2) * (fun(5) + 2 * sum(fun(xj)) + fun(7))
                lower.tolerance<-correct$value-as.numeric(tolerance)
                upper.tolerance<-correct$value+as.numeric(tolerance)
                if (trap < upper.tolerance & trap > lower.tolerance) break}
              return(n)}
            if (rule=="Simpson"){
              repeat {
                n<-begin
                h <- (7 - 5) / n
                x<- seq.int(5, 7, length.out = n + 1)
                xj <-(fun(x))
                xj_1<-xj
                for (i in 1:length(xj)){
                  if((i %% 2) == 0){
                    xj_1[i]<-xj[i]*4} 
                  else {xj_1[i]<-xj[i]*2}}
                xj_1[1]<-xj[1]
                xj_1[length(xj)]<-xj[length(xj)]
                t<-h/3*(xj_1)
                sim<-sum(t)
                lower.tolerance<-correct$value-as.numeric(tolerance)
                upper.tolerance<-correct$value+as.numeric(tolerance)
                if (sim < upper.tolerance & sim > lower.tolerance) break}
              return(n)}
          })

integrand <- function(x) {1/((x+1)*sqrt(x))}
tolTest(fun=integrand, tolerance=0.5, rule="Simpson", start=3, correct=integrate(integrand, lower=5,upper=7))
