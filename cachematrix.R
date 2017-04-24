## Put comments here that give an overall description of what your
## functions do
# commit 497b03943f373888afab2e14ec5157ab096c9162
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  # Define function to set the value of the matrix and also clears the old
  # inverse from the cache
  set <- function(y) {
    x <<- y  # Set the value
    m <<- NULL # Clear the cache
  }
  # Define function to get the value of the matrix.
  get <- function() x
  # Define function to set the inverse.
  setinverse <- function(solve) m <<- solve
  # Define function to get the inverse
  getinverse <- function() m
  # Return a list with the above four functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	m <- x$getinverse() # This gets the cached value for the inverse
	  if(!is.null(m)) {  # If the cache was not empty then return it
		message("getting cached data")
		return(m)
	  }
	  data <- x$get() # Get value of matrix
	  m <- solve(data, ...) # Calculate inverse
	  x$setinverse(m) # Cache the result
	  m # Return a matrix that is the inverse of 'x'
			
}
