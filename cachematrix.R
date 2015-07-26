## The aim of the project is to cache time consuming computations in a Matrix Inverse calculation.
## makeCacheMatrix and cacheSolve functions are used to solve the inverse of the matrix and cache it for furture use.


## makeCacheMatrix:
## This function is used to create a list containing a function to:
## set the value of the Matix 
## get the value of the Matrix
## set the value of the Inverse of the Matrix
## get the value of the Inverse of the Matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinversematrix <- function(solve) m <<- solve
  getinversematrix <- function() m
  list(set = set, get = get,
       setinversematrix = setinversematrix,
       getinversematrix = getinversematrix)
  
  
}


## cacheSolve
## The function checks if the Inverse of the matix is calculated before. 
## If the inverse of the matirx is in cache, it gets the Inverse Matrix from the cache. 
## Else, it computes the Inverse using R function "solve".

cacheSolve <- function(x, ...) {
  m <- x$getinversematrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinversematrix(m)
  m
  
}
