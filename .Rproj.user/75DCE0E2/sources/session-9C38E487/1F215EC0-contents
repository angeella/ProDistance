#' @title Compute Procrustes-based distance
#' @description It compute the Frobenius distance between two orthogonal
#' when the first one is aligned by OPP to the second one.
#' @usage orthogonalDistance(X1, X2)
#' @param X1 first matrix. It can be a data functionally aligned matrix or
#' estimated orthogonal matrix
#' @param X2 second matrix. It can be a data functionally aligned matrix or
#' estimated orthogonal matrix
#' @param rotational specify if you want rotational-based distance or not. Default to FALSE.
#' @return Procrustes-based distance
#' @export
#' @author Angela Andreella


procrustesDistance <- function(X1, X2, rotational){

  R <- OPP(X1, X2)

  if(rotational){
  D <- svd(R, nu = 0,nv = 0)
  dist <- 2*nrow(X1) - 2 * sum(D)

  }else{

    dist <- FrobeniusDistance(X1 %*% R, X2)
  }



  return(dist)
}
