#' transitionAbsolute
#' 
#' Calculates the absolute values of the voter transitions, i.e. how many voters have actually shifted from one election to the next
#' @param Old m by n matrix of values for n choices in m districts
#' @param New m by p matrix of values for n choices in m districts
#' @param Transition n by b matrix of transition values, all should be positive,
#'   row sums should be one
#' @export

transitionAbsolute <- function (Old, Transition) {
  
 
  ergebnisAltSumme <- colSums (Old)
  
  return (Old * Transition)
}