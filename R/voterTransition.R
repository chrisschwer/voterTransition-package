#' voterTransition: A package for estimating voter transition flows
#' 
#' Estimates the flow of voters from one election to the next using a variant of gradient descent.
#' 
#' Formally: Given a previous set of voting choices in matrix \eqn{O} of size \eqn{m x n} and a new set of
#' voting choices in matrix \eqn{N} of size \eqn{m x p}, a transition matrix \eqn{T} of size \eqn{p x n} is 
#' optimal if it minimizes the error defined as 
#' $$\sum_{i=1}^p \sum_{j=1}^n\left( N_{i,j}-M_{i,j} \right)^2$$
#' where \eqn{M = O T}, while for all \eqn{i, j} \eqn{T_{i,j} >= 0} and for all \eqn{i} \eqn{\sum_{j=1}^p T_{i,j} = 1}. 
#' 
#' Core function is \code{\link{optimTransition}}, with a variant 
#' \code{\link{optimTransitionCluster}} supporting the split of the matrices by clusters.
#' 
#' @name voterTransition
"_PACKAGE"