#' @title Compute procrustes-based distance matrix
#' @description It compute the distance matrix based on distance from
#' \code{procrustesDistance}
#' @usage procrustesDistanceMatrix(X)
#' @param X array of orthogonal or functionally aligned matrices
#' where the first dimension is the number of matrices to be analyzed
#' @param rotational are the matrices orthogonal?
#' @return procrustes-based distance matrix
#' @export
#' @author Angela Andreella


procrustesDistanceMatrix <- function(X, rotational = FALSE){

  N <- dim(X)[1]
  ncomb <- t(combn(N, 2))
  D <- matrix(0, nrow = N, ncol = N)

  D[upper.tri(D)] <- sapply(seq(nrow(ncomb)),
                         function(x) procrustesDistance(X1 = X[ncomb[x,1],,],
                                                        X2 =  X[ncomb[x,2],,],
                                                        rotational = rotational))
  D[lower.tri(D)] <- D[upper.tri(D)]

  return(D)
}
