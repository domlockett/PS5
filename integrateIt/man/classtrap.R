#' A squared value object 
#' 
#' Object of class \code{Trapezoid} are created by the \code{integrateIt} function.
#'
#' 
#' An object of the class `Trapezoid' has the following slots:
#' \itemize{
#' \item \code{result} The integrated value
#' \item \code{x} The first input
#' \item \code{y} the second input 
#' }
#'
#' @author Dominique M. Lockett: \email{dlockett@@wustl.edu}
#' @aliases Trapezoid-class initialize,Trapezoid-method 
#' @rdname Trapezoid
#' @export

setClass(Class="Trapezoid", 
         representation = representation(
           result = "numeric",
           x="numeric",
           y="numeric"
         ),
         prototype = prototype(
           result =  c(),
           x= c(),
           y= c())
)
