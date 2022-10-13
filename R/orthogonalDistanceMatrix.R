#' @title Compute Orthogonal-based distance matrix
#' @description It compute the distance matrix based on distance from
#' \code{orthogonalDistance}
#' @usage orthogonalDistanceMatrix(X)
#' @param X array of orthogonal matrices where the first dimension is the
#' number of matrices to be analyzed
#' @return orthogonal-based distance matrix
#' @export
#' @author Angela Andreella


orthogonalDistanceMatrix <- function(X){

  N <- dim(X)[1]
  ncomb <- t(combn(N, 2))
  D <- matrix(0, nrow = N, ncol = N)

  D[upper.tri(D)] <- sapply(seq(nrow(ncomb)),
                         function(x) orthogonalDistance(X[ncomb[x,1],,],
                                                        X[ncomb[x,2],,]))

  D <- D + diag(N)
  D[lower.tri(D)] <- D[upper.tri(D)]

  return(D)
}
