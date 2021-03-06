#' Correlated Normal Vector
#'
#' \code{rnorm_pre} Produces a random normally distributed vector with the specified correlation to an existing vector
#'
#' @param x the existing vector
#' @param rho desired correlation between existing and returned vectors
#' @param ymean desired mean of returned vector
#' @param ysd desired SD of returned vector
#' 
#' @return vector
#' @examples
#' v1 <- rnorm(10)
#' v2 <- rnorm_pre(v1, 0.5, 0, 1)
#' cor(v1, v2)
#' @export

rnorm_pre <- function (x, rho=0, ymean=0, ysd=1) {
  # error checking
  if (!is.vector(x)) stop("x must be a vector") 
  if (!is.numeric(x)) stop("x must be numeric")
  if (length(x) < 3) stop("x must have length > 2")
  
  n <- length(x)
  y <- stats::rnorm(n)
  z <- rho * scale(x)[,1] + sqrt(1 - rho^2) * 
    scale(stats::resid(stats::lm(y ~ x)))[,1]
  yresult <- ymean + ysd * z
  
  return(yresult)
}
