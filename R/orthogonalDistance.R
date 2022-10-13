#' @title Compute Orthogonal-based distance
#' @description It compute the Frobenius distance between two orthogonal
#' when the first one is aligned by OPP to the second one.
#' @usage orthogonalDistance(X1, X2)
#' @param X1 first matrix
#' @param X2 second matrix
#' @return orthogonal-based distance
#' @export
#' @author Angela Andreella


orthogonalDistance <- function(X1, X2){

  R <- OPP(X1, X2)

  dist <- FrobeniusDistance(X1 %*% R, X2)

  return(dist)
}
