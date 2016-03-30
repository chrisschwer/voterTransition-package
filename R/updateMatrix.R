#' updateMatrix
#' 
#' Updates the Transition matrix by subtracting a fraction of the gradient
#' @inheritParams errorCalculation
#' @inheritParams errorGradient
#' @param alpha step size \eqn{\alpha}, defaults to 0.000000000001
#' @export

updateMatrix <- function (Old, New, Transition,
                          n, p, epsilon = 0.0000001, alpha = 0.000000000001) {
  
  
  Transition <- Transition - 
    (alpha * errorGradient (Old, New, Transition,
                             n, p, epsilon))
  
  return (Transition)
}