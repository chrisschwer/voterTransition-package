#' optimTransitionCluster
#' 
#' Splits the data set according to clusterids and calculates Transition matrices for each cluster individually
#' @inheritParams errorCalculation
#' @inheritParams errorGradient
#' @inheritParams updateMatrix
#' @inheritParams optimTransition
#' @param clusterids vector of clusterIDs in range 1:k, where k ist the number of clusters
#' @export

optimTransitionCluster <- function (Old, New, Transition = NA,
                                          iterations = 1000,
                                          epsilon = 0.0000001, alpha = NA,
                                          documentation = FALSE,
                                          clusterids) {
  
 
  numberClusters <- max (clusterids)
  wanderung_initial <- Transition
  
  relativ <- list()
  fehler <- list()
  absolut <- list()
  gesamt <- matrix (0, dim (Transition)[1], dim (Transition)[2])
  
  for (i in 1:numberClusters) {
    # Aufteilen der Vektoren auf die Cluster
    alt <- subset (Old, clusterids == i)
    neu <- subset (New, clusterids == i)
    
    # Optimieren der (relativen) Wanderungsmatrizen
    temp <- optimTransition (Old, New, wanderung_initial,
                                  iterations,
                                  epsilon, alpha,
                                  documentation = FALSE)
    relativ [[i]] <- temp$Transition
    fehler[[i]] <- temp$Errors
    
    # Absolute Übergänge rechnen
    absolut [[i]] <- colSums(alt) * temp$Transition
    
    # Aufaddieren der absoluten Übergänge
    gesamt <- gesamt + absolut [[i]]
    
  }
  if (documentation) {
    return (list (Total = gesamt, Transition = relativ,
                  Errors = fehler, Old = Old, 
                  New = New, InitialTransition = wanderung_initial,
                  Epsilon = epsilon, Alpha = alpha, ClusterIDs = clusterids
                  ))
  } else {
    return (list (Total = gesamt, Transition = relativ,
                  Errors = fehler))  
  }
  
  
  
  
  
}
  