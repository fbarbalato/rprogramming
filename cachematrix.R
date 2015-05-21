## This functions create an object able to store a matrix calculate the inverse and store its value (cached) on a list. When the 
## inverse is required and the matrix has not been changed the cache value is returned saving resorces of the   

## This function has a list where we store a given matrix through the set instruction and get()
## retreives. This function is  and the matrix inverse values. 
makeCacheMatrix <- function(x = matrix()) {

      m <- NULL			#set the m value = NULL (empty)
        set <- function(y) {
                x <<- y		#The value of y is stored in x into 
					#the main function makeCacheMatix  
                m <<- NULL	#when a new matrix is entered m is restored
					#to NULL in the main function as the old value
					#is not needed anymore
        }
     get <- function(){		#get the value of x stored in makeCacheMatrix
	      x			#with the set function 
     }
     setinverse <- function(inverse){  
            m <<-inverse	# change the value of m in the main function makeCacheMatrix 
					#  m is the result of the inverse matrix  
					#  calculation through the function cacheSolve
					
     }  
     getinverse<- function() {#get the value of the stored m. If NULL is retrieved
		m			#new matrix was store, last computed inverse matrix otherwise
     }	
	list(set = set, get = get, setinverse = setinverse,
             getinverse = getinverse)#function list where we store 
						 #results from the above 4 functions  						 
						 #that will be available to the object  
						 #makeCacheMatrix will be assignet to 
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
