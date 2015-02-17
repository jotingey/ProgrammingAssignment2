## cacheMatrix.R takes a Matrix and creates functions to be used subsequently to retrieve the inverse and cache it.

## makeCacheMatrix is going to create functions to be used by the cacheSolve function to generate the inverse


makeCacheMatrix<-function(x=matrix()){
  m <- NULL
  set <- function(y) {
        x <<- y
        m <<- NULL
  }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list (set=set, get = get, setInverse=setInverse, getInverse=getInverse)
  
    
    
}

## cacheSolve is going to return the inverse and if the inverse already exists it will return 
##the cached inverse the makeCacheMatrix function.

cacheSolve <-function(x,...){
  m <- x$getInverse()
  if(!is.null(m)){
          message("getting cached data")
          return(m)
  }
 data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}