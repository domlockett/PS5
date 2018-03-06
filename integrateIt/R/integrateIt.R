#' Integrating values
#'
#' Finds the Integrated value of vectors
#'
#' @param x A numeric object
#' @param y A numeric object with the same dimensionality as \code{x}.
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
#' myx<-seq(1,11,1)
#' myy<-seq(11,21,1)
#' integrateIt(x,y,bounds=c(1,10), rule="trap")
#' @seealso 
#' @rdname integrateIt
#' @aliases integrateIt,ANY-method
#' @export

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
x<-seq(1,11,1)
y<-seq(11,21,1)
integrateIt(x,y,bounds=c(1,10), rule="trap")
integrateIt(x,y,bounds=c(1,10), rule="simp")
