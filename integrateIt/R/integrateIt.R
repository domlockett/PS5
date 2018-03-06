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
#' x<-seq(1,11,1)
#'y<-seq(11,21,1)
#'bounds<-c(1,10)
#'rule<-"Trap"
#'integrateIt(x, y, bounds, rule)
#' integrateIt(x,y,bounds=c(1,10), rule="trap")
#' @seealso 
#' @rdname integrateIt
#' @aliases integrateIt,ANY-method
#' @export
setGeneric(name = "integrateIt",
          def = function(x, y, bounds, rule){
            standardGeneric("integrateIt")
          })

#' @export
setMethod(f = "integrateIt",
          definition = function(x, y, bounds, rule){
            # we set up the specifications we need to perform analysis
            a<-bounds[1]
            b<-bounds[2]
            #set up min max
            h<-(b-a)/(length(x)-1)
            #set up h
            if(identical(rule,"Trap")){
              #if trap do this
              trap<-h/2*(2*sum(y)-y[1]-y[length(y)])
              #perform trapezoid analysis
              return(new("Trapezoid", x = x, y = y, result = trap))
            }
            else if(identical(rule,"Simpson")){
              #otherwise perfrom Simpson analysis
              s<-h/3*(y[1]+y[length(y)])
              for(i in 2:(length(y)-1)){
                if(i%%2==0){
                  s<-s+h/3*4*y[i]
                }
                else if(i%%2==1){
                  simpson<-s+h/3*2*y[i]
                }
              }
              return(new("Simpson", x = x, y = y, result = simpson))
            }
          }
)

?integrateIt

