library(devtools)
library(roxygen2)
context(intergrateIt)
x<-seq(1,11,1)
y<-seq(11,21,1)
bounds<-c(1,10)
rule<-"Trap"
rule2<-"Simpson"
test_that("test if trapezoid integrates", {
  expect_that(integrateIt(x,y,bounds, rule),
              equals(new("Trapezoid",  x = x, y = y, result=(144),)))
})
test_that("test if Simpson integrates", {
  expect_that(integrateIt(x,y,bounds, rule2),
              equals(new("Simpson", x = x, y = y,result=(144))))
})
test_that("test that does what you want",{
          (expect_error(integrateIt("p")))
})

test_that("check that its the right class",{
  (expect_is(x,y,bounds, rule, "Trapeziod"))
 
})
test_that("check that its the right class",{
  (expect_is(x,y,bounds, rule2, "Simpson"))
  
})


