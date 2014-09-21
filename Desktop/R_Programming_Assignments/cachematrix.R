makeCacheMatrix <- function(x = matrix())
{
inv <- NULL
## set the value of the matrix
set <- function(y)
{
x <<- y
inv <<- NULL
}
## get the value of the matrix 
get <- function() x

## set the value of inverse

setinv <- function(inverse)
{
inv <<- inverse
}
getinv <- function() inv

list(set = set, get = get, setinv = setinv, getinv = getinv)
}

cacheSolve <- function(x, ...) {
inv <- x$getinv()
if(!is.null(inv))
{
message("getting cached data")
return(inv)
}
data <- x$get()
inv <- solve(data,...)
x$setinv(inv)
inv
}
## for matrix inverse solve() is there