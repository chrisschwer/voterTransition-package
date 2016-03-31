#' updateMatrix
#' 
#' Updates the Transition matrix by subtracting a fraction of the gradient
#' @param Old m by n matrix of values for n choices in m districts
#' @param New m by p matrix of values for n choices in m districts
#' @param Transition n by b matrix of transition values, all should be positive,
#'   row sums should be one
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