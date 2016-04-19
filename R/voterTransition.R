#' voterTransition: A package for estimating voter transition flows
#' 
#' Estimates the flow of voters from one election to the next using a variant of gradient descent.
#' 
#' Formally: Given a previous set of voting choices in matrix \eqn{O} of size \eqn{m x n} and a new set of
#' voting choices in matrix \eqn{N} of size \eqn{m x p}, a transition matrix \eqn{T} of size \eqn{p x n} is 
#' optimal if it minimizes the error defined as the squared difference between the predicted
#' outcome in the second election (\eqn{O T}) and the actual outcome in the new election
#' (\eqn{N}). All elements of \eqn{T} are non-negative and all row sums of \eqn{T} are 1.
#' 
#' Core function is \code{\link{optimTransition}}, with a variant 
#' \code{\link{optimTransitionCluster}} supporting the split of the matrices by clusters.
#' 
#' @docType package
#' @name voterTransition
NULL