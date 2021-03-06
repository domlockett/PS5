% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/integrateIt.R, R/toltest.R
\name{integrateIt}
\alias{integrateIt}
\alias{integrateIt,ANY-method}
\alias{tolTest}
\alias{integrateIt,ANY-method}
\title{Integrating values}
\usage{
integrateIt(x, y, bounds, rule)

tolTest(fun, tolerance, rule, start, correct, ...)
}
\arguments{
\item{x}{A numeric object}

\item{y}{A numeric object with the same dimensionality as \code{x}.}

\item{rule}{A numeric object with the same dimensionality as \code{x}.}

\item{fun}{A numeric object}

\item{tolerance}{A numeric object with the same dimensionality as \code{x}.}

\item{start}{A numeric object with the same dimensionality as \code{x}.}

\item{correct}{A numeric object with the same dimensionality as \code{x}.}
}
\value{
An object of class Trapezoid or Simpson containing
 \item{bounds}{The integral of the x and y values}
 \item{x}{The first object input} 
 \item{y}{The second object input}
 \item{trap}
 \item{simp}

An object of class Trapezoid or Simpson containing
 \item{bounds}{The integral of the x and y values}
 \item{x}{The first object input} 
 \item{y}{The second object input}
 \item{trap}
 \item{simp}
}
\description{
Finds the Integrated value of vectors

Finds the Integrated value of vectors
}
\note{
This is not a very simple function

This is not a very simple function
}
\examples{

x<-seq(1,11,1)
y<-seq(11,21,1)
bounds<-c(1,10)
rule<-"Trap"
integrateIt(x, y, bounds, rule)
integrateIt(x,y,bounds=c(1,10), rule="trap")

x<-seq(1,11,1)
y<-seq(11,21,1)
bounds<-c(1,10)
rule<-"Trap"
integrateIt(x, y, bounds, rule)
integrateIt(x,y,bounds, rule=)
}
\author{
Dominique M. Lockett

Dominique M. Lockett
}
