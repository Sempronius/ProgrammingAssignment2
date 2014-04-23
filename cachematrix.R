## Put comments here that give an overall description of what your
## functions do

## see comments in the program

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y # This is overriding the value of x previously , because we want to 'set' a new one!
                i <<- NULL #Since we are setting a new variable, we need to reset i on line 7
        }
        get <- function() {   # this line makes a FUNCTION out of "get", which prints x.
                x
        }
        setinverse <- function(inverse) {  # setinverse is a function of the input "inverse". this function assigns "inverse" to "i"
                i <<- inverse   #this input "inverse" is now going to OVERRIDE the i in line 7.
        }
        getinverse <- function() {  #this function simply prints the value of i
                i
        }
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
                
}
## see comments in the program...

cacheSolve <- function(x, ...) {
       cacheSolve <- function(x, ...) {
        i <- x$getinverse() # x is a RESULT from the makeCacheMatrix.R function. The $ accesses the 'getinverse()' function... inside the function makeCacheMatrix.R !
        if(!is.null(i)) { #this is a simply if statement to see if you have already calculated the inverse of x. If so, it just spits out i!
                message("getting cached data")
                return(i)
        }
        data <- x$get() # So, this assigns the value of the get() function of x (a result from makeCacheMatrix.R) to data. Which is whatever you put in the original makeCacheMatrix(*HERE*)
        i <- solve(data, ...) #just calculates the inverse of data, and assigns it to i.
        x$setinverse(i) # accesses the function setmean stored in x... and puts m into it. Remember: setmean(mean) { m <<- mean }.THis overrides m in the original x *result of makevector* 
        i
}
