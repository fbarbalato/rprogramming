## These two functions together are able to store a given matrix, calculate its inverse and store the results on 
## a list. When the inverse has already been calculated and the matrix not been changed the cache value is returned saving computational  
## resorces. In order to avoid errors we assume all matrices are invertibles.

## Following function (makeCacheMatrix) would be associated to an object. A list defined into the makeCacheMatrix is used 
## by the object to store a given matrix (through the set instruction), get the matrix (through the get() function), store the
## returned value by cacheSolve from the inverse calculation (stored with setinverse()) and get the inverse (getinverse()).
## Calling cacheSolve function we would pass the makeCacheMatrix assigned object to it as an argument. The function will then 
## calculate, return the inverse matrix and store it in the object's list.
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


## cacheSolve function returns a matrix that is the inverse of 'x'. Result is stored into the object list defined
## by the makeCacheMatrix function at the m's place.
## If the inverse value already exist (m is <> NULL i.e. matrix has not changed and the inverse has already been calculated)
## then the previously stored value is returned. New calculation of the inverse matrix otherwise.
cacheSolve <- function(x, ...) {
       
	  m <- x$getinverse()		        #retrieve m
        	if(!is.null(m)) {		#is m <> 0 ? then
                message("getting cached inverse")  # Inform the value has already been calculated 
                return(m)		        # display m		
        }
        data <- x$get()			# m = 0 -> a new matrix was inserted, retrieve then new matrix data
        m <- solve(data,...)		#calculate the inverse
        x$setinverse(m)			#store the result into m
        m				#return m
}



