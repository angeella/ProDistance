#' @title Compute Procrustes-based distance
#' @description It compute the Frobenius distance between two matrices
#' @usage procrustesDistance(X1, X2)
#' @param X1 first matrix. It can be a functionally aligned matrix or
#' estimated orthogonal matrix
#' @param X2 second matrix. It can be a functionally aligned matrix or
#' estimated orthogonal matrix
#' @param rotational are the two \code{X1} and  \code{X2} matrices orthogonal?
#' @return Procrustes-based distance
#' @export
#' @author Angela Andreella


procrustesDistance <- function(X1, X2, rotational = FALSE){



  if(rotational){

  dist <- 2*nrow(X1) - 2 * sum(diag(t(X1) %*% X2))
  }else{

    dist <- FrobeniusDistance(X1, X2)
  }



  return(dist)
}
