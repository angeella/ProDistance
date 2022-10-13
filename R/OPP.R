#' @title Compute Orthogonal Procrustes Problem
#' @description It compute the optimal orthogonal matrices that minimize the Frobenius distance between two matrices
#' @usage OPP(X1, X2)
#' @param X1 first matrix
#' @param X2 second matrix
#' @return optimal orthogonal matrix
#' @export
#' @author Angela Andreella


OPP <- function(X1, X2){

  out <- svd(t(X1)%*% X2)

  R <- out$u %*% t(out$v)

  return(R)
}
