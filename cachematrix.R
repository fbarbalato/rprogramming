## This functions create an object able to store a matrix, calculate its inverse and store the results (cached) on a list. When 
## the inverse has already been calculated and the matrix not been changed the cache value is returned saving computational  
## resorces. In order to avoid errors we assume all matrices inserted are invertibles

## This function associated to an object stores on a list a given matrix (through the set instruction) and the inverse matrix computed through the 
## cacheSolve function with the setinverse instruction. get() retrieves the matrix and getinverse() the inverse matrix.
makeCacheMatrix <- function(x = matrix()) {

      m <- NULL			#  m is initialized to the value = NULL (empty)
        set <- function(y) {
                x <<- y		#  The value of y is stored in x into the main function makeCacheMatix  
                m <<- NULL	#  when a new matrix is entered m is restored
				#  to NULL in the main function as the old value
				#  is not needed anymore
        }
     get <- function(){		#  get the value of x stored in makeCacheMatrix
	      x			#  with the set function 
     }
     setinverse <- function(inverse){  
            m <<-inverse	#  changes the value of m in the main function makeCacheMatrix 
				#  m is the result of the inverse matrix  
				#  calculation through the function cacheSolve
					
     }  
     getinverse<- function() {  # get the value of the stored m. If NULL is retrieved
		m		# new matrix was stored, last computed inverse matrix otherwise
     }	
	list(set = set, get = get, setinverse = setinverse,
             getinverse = getinverse)  # function list where we store 
				       # results from the above functions  						 
				       # that will be available to the object assigned to makeCacheMatrix 
}


## cacheSolve function returns a matrix that is the inverse of 'x'
##passes it to makeCacheMatrix where will be stored inside the stack at the place of (m). getinverse() points at it.
##If m is <> NULL then the the m value is returned 
cacheSolve <- function(x, ...) {
       
	  m <- x$getinverse()		        #retrieve m
        	if(!is.null(m)) {		#is m <> 0 ? then
                message("getting cached data")  # Inform the value has already been calculated 
                return(m)		        # display m		
        }
        data <- x$get()			# m = 0 -> a new matrix was inserted, retrieve then new matrix data
        m <- solve(data,...)		#calculate the inverse
        x$setinverse(m)			#store the result into m
        m				#return m
}



