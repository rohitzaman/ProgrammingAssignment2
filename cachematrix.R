## A pair of functions that cache the inverse of a matrix.the following functions are : makeCacheMatrix and cacheSolve.

## The first function, makeCacheMatrix creates a matrix which contains some functions to :set the value of the matrix,get the value of the matrix,set the value of the inverse matrix and get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## The following function calculates the mean of the matrix However, it first checks to see if the matrix is null or not. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inversed matrix in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}
