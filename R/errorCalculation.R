#' errorCalculation
#' 
#' This helper function calculates the error, defined as the sum of squared
#' differences between the modelled results and the actual results
#' @param Old m by n matrix of values for n choices in m districts
#' @param New m by p matrix of values for n choices in m districts
#' @param Transition n by b matrix of transition values, all should be positive,
#'   row sums should be one
#' @export

errorCalculation <- function (Old, New, Transition) {
   
  ergebnisModell <- Old %*% Transition
  ergebnisDelta <- ergebnisModell - New
  
  return (sum(rowSums(ergebnisDelta^2)))
}