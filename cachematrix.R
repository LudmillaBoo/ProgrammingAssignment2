## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        ## Initialize the inverse property
        i <- NULL
        set <- function( matrix ) {
                m <<- matrix
                i <<- NULL
        }
        ## Method the get the matrix
        get <- function() {
                ## Return the matrix
                m
        }
        ## Way to set the inverse of the matrix
        setInverse <- function(inverse) {
                i <<- inverse
        }
        ## Way to get the inverse of the matrix
      getInverse <- function() {
                ## Back the inverse property
                i
      }
      ## Back a list of the methods
      list(set = set, get = get,setInverse = setInverse,getInverse = getInverse)
}

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(matrix) {
                m <<- matrix
                i <<- NULL
        }
        get <- function() {
                m
        } 
        setInverse <- function(inverse) {
                i <<- inverse
        }
        getInverse <- function(inverse) {
                i
        }
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## cacheSolve computes the inverse of the unique matrix back by "makeCacheMatrix" back to the matrix "m"

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)){
    messsage("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
