context("integrateIt")
x<-seq(1,11,1)
y<-seq(11,21,1)
test_that("test if trapezoid integrates", {
  expect_that(integrateIt(x,y,bounds=c(1,10), rule="trap"),
              equals(new("Trapezoid", result=(145.4545), x = x, y = y)))
})
test_that("test if trapezoid integrates", {
  expect_that(integrateIt(x,y,bounds=c(1,10), rule="simp"),
              equals(new("Trapezoid", result=(145.4545), x = x, y = y)))
})
test_that("test that does what you want",{
          (expect_error(integrateIt("p")))
})

test_that("check that its the right class",{
  (expect_is(x,y,bounds=c(1,10), rule="trap", "Trapeziod"))
 
})
test_that("check that its the right class",{
  (expect_is(x,y,bounds=c(1,10), rule="simp", "Simpson"))
  
})


