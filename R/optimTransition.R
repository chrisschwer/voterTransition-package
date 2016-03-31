#' optimTransition
#' 
#' Core function of the package, uses gradient descent to find optimal
#' Transition matrix
#' @param Old m by n matrix of values for n choices in m districts
#' @param New m by p matrix of values for n choices in m districts
#' @param Transition n by b matrix of transition values, all should be positive,
#'   row sums should be one, defaults to a matrix of equal values
#' @inheritParams errorGradient
#' @param alpha step size \eqn{\alpha}, defaults to .01 / initial error
#' @param iterations number of iterations, defaults to 1000
#' @param documentation boolean indicating whether long results (including
#'   parameters of function call) shall be returned. Defaults to FALSE
#' @export   

optimTransition <- function (Old, New, Transition = NA,
                                  iterations = 1000,
                                  epsilon = 0.0000001, alpha = NA,
                                  documentation = FALSE) {
    
  if (is.na(Transition)) {
    Transition <- matrix (1/dim(New)[2], dim(Old)[2], dim(New)[2])
  }
  
  n <- dim (Transition) [1]
  p <- dim (Transition) [2]
  
  wanderung_initial <- Transition
  
  zeilenTitel <- rownames(Transition)
  spaltenTitel <- colnames(Transition)
  
  fehler <- data.frame (Step = 0,
                        Error = errorCalculation (Old, New, Transition))
  
  if (is.na(alpha)) {
    alpha <- 0.01 / fehler$Error
  }
  
  for (i in 1:iterations) {
    Transition <- updateMatrix (Old, New, Transition,
                               n, p, epsilon, alpha)
    
    # Minimalwert 0 festlegen
    Transition <- matrix (sapply (Transition, 
                                 function (x) {max (0,x)}),
                         n, p)
    
    # Ggf. die anderen Werte in der Reihe anheben
    Transition <- Transition / rowSums (Transition)
    
    # Ergebnis des Iterationsschritts festhalten
    fehler <- rbind (fehler, c(i, errorCalculation (Old, New, Transition)))
    
  }
  
  rownames(Transition) <- zeilenTitel
  colnames(Transition) <- spaltenTitel
  
  if (documentation) {
    return (list (Transition = Transition, Errors = fehler,
                  Old = Old, New = New,
                  InitialTransition = wanderung_initial,
                  Iterations = iterations, Epsilon = epsilon,
                  Alpha = alpha
  ))} else {
    return (list (Transition = Transition, Errors = fehler))
  }
  
  
}