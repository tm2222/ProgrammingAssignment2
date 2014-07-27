## The pair of functions compute and cache the inverse of a matrix

## Creates a list of functions that set and get the value of x 
## and the value of the inverse from the cache

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    oldMat <- NULL
    set <- function(newMat) {
        x <<- newMat
        #    oldMat <<- x
        inv <<- NULL
    }
    get <- function() x
    #getOld <- function() oldMat
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
}


## This function fetches the cached value of 'inv'
## if the 'inv' value exists and the matrix exists from an earlier run,
## it will return the cached inverse value
## else it will compute the inverse, set it to cache and return it
## It also stores the matrix as 'mat_old' 

cacheSolve <- function(x, ...) {
		inv <- x$getinv()
    liveMat <- x$get()
    if(!is.null(inv) & !is.null(mat_old)) {
            message("Getting cached data")
            return(inv)
    }
    inv <- solve(liveMat, ...)
    x$setinv(inv)
    mat_old <<- liveMat
    inv
}
