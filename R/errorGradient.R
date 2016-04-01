#' errorGradient
#' 
#' This helper function calculates the partial gradient numerically for each element of Transition
#' @param Old m by n matrix of values for n choices in m districts
#' @param New m by p matrix of values for n choices in m districts
#' @param Transition n by b matrix of transition values, all should be positive,
#'   row sums should be one
#' @param n the number of outcomes in Old and the number of rows in Transition, provided for performance reasons
#' @param p the number of outcomes in New and the number of rows in Transition, provided for performance reasons
#' @param epsilon '\eqn{\epsilon}'-value for numerical approximation of gradient, defaults to 0.0000001 
#' @export

errorGradient <- function (Old, New, Transition,
                            n, p,
                            epsilon = 0.0000001) {
  
  
  wanderung_gradient <- Transition
  
  for (i in 1:n) {
    for (j in 1:p) {
      wanderung_minus <- Transition
      wanderung_plus <- Transition
      wanderung_minus[i, j] <- Transition[i,j] - epsilon
      wanderung_plus[i, j] <- Transition[i,j] + epsilon
      wanderung_minus[i,] <- wanderung_minus[i,] / (1 - epsilon)
      wanderung_plus[i,] <- wanderung_plus[i,] / (1 + epsilon)
      wanderung_gradient[i,j] <- (errorCalculation (Old, New, wanderung_plus) -
                                    errorCalculation (Old, New, wanderung_minus)) /
        (2*epsilon)
    }
  }
  
  return (wanderung_gradient)
  
}