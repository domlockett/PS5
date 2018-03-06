#' Print values
#'
#' Print the Integrated value of vectors
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
setGeneric(name="print",
           def=function(x, y, bounds, rule,...)
           {standardGeneric("print")}
)

setMethod(f="print",
          definition=function(x,y,bounds=c(a,b),rule, ...){
            x<-as.matrix(x)
            x<-t(x)
            y<-as.matrix(y)
            y<-t(y)
            if (rule=="Trap"){
              trapvec<-y*2
              trapvec[1]<-y[1]
              trapvec[ncol(y)]<-y[ncol(y)]
              h<-(bounds[2]-bounds[1]+1)/ncol(x)
              trapoutput<-h/2*(y_1)
              x<-as.vector(x)
              y<-as.vector(y)
              return(result=sum(trapoutput))
            }
            if (rule=="Simpson"){
              simpvec<-y
              for (i in 1:ncol(y)){
                if((i %% 2) == 0){
                  simpvec[i]<-y[i]*4} 
                else {simpvec[i]<-y[i]*2}}
              simpvec[1]<-y[1]
              simpvec[ncol(y)]<-y[ncol(y)]
              h<-(bounds[2]-bounds[1]+1)/ncol(x)
              simpoutput<-h/3*(simpvec)
              x<-as.vector(x)
              y<-as.vector(y)
              return(result=sum(simpoutput))}
          }
)