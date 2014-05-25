## This function takes a matrix as the input x. In the end,
## it will create a variable that is a list (containing the functions: set, get, setinverse, and getinverse)  
##The files cacheSolve.R will take as an input, a variable created from makeCacheMatrix.R
## in order to output the inverse of the matrix.


makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) { ## creates a function
                x <<- y ## y overrides x. 
                i <<- NULL ## Null overrides i
        }
        get <- function() { ## creates  a function
                x ## displays value of x
        }
        setinverse <- function(inverse) {
                ## creates function
                i <<- inverse ## value of inverse
                ## overrides value of i.
        }
        getinverse <- function() {
                ## creates a function
                i ## displays the value of i
        }
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
                
}
      
                
}
## This function takes an input x , which is the RESULT from the 'makeCacheMatrix.R' function.

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        ##The $ accesses the 'getinverse()' function, which is inside the function makeCacheMatrix.R !
        if(!is.null(i)) { #this is a simply if statement to see if you have already calculated 
                ##the inverse of x. If so, it just spits out i!
                message("getting cached data")
                return(i)
        }
        data <- x$get() # So, this assigns the value of the 
        ## get() function of x (a result from makeCacheMatrix.R) 
        ## to data. Which is whatever you put in the original makeCacheMatrix(*HERE*)
        i <- solve(data, ...) #just calculates the inverse of data, and assigns it to i.
        x$setinverse(i) # accesses the function setmean stored in x... and puts m into it. 
        ## Remember: setmean(mean) { m <<- mean }.
        ##THis overrides m in the original x *result of makevector* 
        i
        }
