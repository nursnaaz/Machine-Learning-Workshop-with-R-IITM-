
######R as a Calculator######
2+2
2-3+1
2/3*2
2*3/2
2^3
2^3*2
2^(3*2)

###Mathematical functions in R
log(# Some of the Built in constants
10)
log(10,2) ##log(number,base)
sqrt(25)
sin(1)
cos(x = 45)

# Some of the Built in constants
pi

LETTERS

letters

month.name

month.abb[12]

############################Data Types in R######################################
# a.  Numeric --real numbers 
# b.  Integer-- positive and negative whole  numbers including zero
# c.  logical-- True or False 
# d.  character-- alphabets/special characters
# e.  complex--  z<-1+2i;  Arg(0+1i); Mod(2-3i)

nos <- 10:1
#setting a directory
setwd("C:/INSOFE")

#Getting the directory path
getwd()

#Generating a sequence of numbers using scope operator and assigning to a variable
numbers<-10:15
numbers

#Generating a sequence of numbers using a "seq" function
numbers <- seq(1,10)
numbers
numbers<-seq(1,10,2) 
numbers

#Using  the "c" (concatenate) , we use this most of the time
numbers<-c(1,2,10)
numbers

#########################Variables in R########################################
# a.  Scalar -- a single number/character
x=5
x="a" 

#b.	Vector-- a sequence of elements
x<-c(1,2,3,4,5) 
x<-c("a","c")
y<-c("alpha",7)  
z <- c(T,F,TRUE,FALSE)

#To know the data type or class

class(z)

x <- c(1,3,5,7,9)

y <- c(2,4,6,8,10)

# Element wise addition

x+y

# Elementwise subtraction

x-y

# Elementwise multiplication

x * y 

# Elementwise division

x / y


########################################

x <- c(1,2,3,4,5,6)

y <- c(10,20) 

x + y # here vector y gets replicated so that vector addition be completed 


### Binding the vectors- Row binding and column binding

A <- rbind(x, y) 
A

B <- cbind(x, y)
B

# What if x<-c(1,2,3,4,5) and y<-c("a","b","c","d","e")

x <- c(1,2,3,4,5)

y <- c("a","b","c","d","e")

A <- rbind(x, y)  # observe the matrix data types
A

class(A)

#c.  matrix--2d arrangement of elements (elements should be of same data type)

x <- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2, byrow=T) #try with character data type
x

z <- matrix(c(1,2,3,4,5,6,7,8,9,0),nrow  = 3,byrow = T,ncol = 5,dimnames = list( c('a','b','c'),c('d','e','f','g','h')))
z


#Row sums and Column sums ,sum of diagonal elements, sum of all elements in Matrix

rowSums(z)

colSums(z)

sum(diag(z))

sum(z)

#d.  dataframe-- it is also a matrix representation but can have multiple data types in it.
##creating an empty data frame

data <-data.frame()

#Creating a data frame

data <- data.frame( Name=c("Alpha","Beta","Gamma"), 
                    Marks=c(29,NA,27),Sex=c("M","F","F"),Location=c("Chennai","Delhi","Bengaluru")) 
data

data[1,3]
str(data)

#For both matrix and data frames: calling referring "elements" by position

x <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=T)
x
x[1,1] # extracting element in first row and first column
x[1,]  #extracting all the elements from first row
x[,2]  #extracting all the elements from second column
x[2,1] #extracting  the element in second row and first column

#To get the dimensions of the matrix

dim(x)


#To name the rows or columns in the matrix
x
dimnames(x)<-list(c("One","Two"),c("Three","Four"))
x

data
names(data)
dimnames(data)

names(data)<-c("Radiation", "Count","abc","def")

data

colnames(data)
rownames(data) <- c("Row1","Row2","Row3")
data

#list-- a  "vector" containing other objects which could be a vector, a dataframe or a list.
#Creating a list

x <- c(1,2,3,4)
x1 <- c(5,6,7,8)
x2 <- list(x,x1)
y <- c("a","b")

z <-  data.frame(name=c("Alpha","Beta","Gamma"), Marks=c(29,30,27))

A <- list(x2,y,z)

x2
A

#Try out the following and observe the output
A
A[1]
A[[1]]
A[1][1]
A[[1]][[1]]

A[[1]][[1]]
A[[1]][[2]]
A[[2]][[1]]
A[[2]][[2]]

#################Saving the work space as image, reading and loading data##################
# The workspace is your current R working environment and includes any user-defined
# objects (vectors, matrices, functions, data frames, and lists)
# The current working directory is the directory from which R will read files and to
# which it will save results by default. You can find out what the current working direc-
#   tory is by using the getwd() function. You can set the current working directory by
# using the setwd() function. If you need to input a file that isn't in the current working
# directory, use the full pathname in the call.

setwd("C:/INSOFE")

getwd()

#a.	Saving workspace

save.image() 

save.image("Save_20161211.RData")

# Loading saved workspace

load("Save_20161211.RData")

#b.	How do save only a few variables from environment

#save(x, y, file="xy.RData")

#c.	Writing data to a file

write.csv(z,"data.csv", row.names=F)  #for different delimited file ??

#d.	Reading the csv files and RData files into R environment

#grade <- read.csv("Grade.csv", header=T, sep = ",")

##Reading other formats we use read.table command  # comma as decimal & : as field sep ?

#read <- read.table("greek.txt",sep="\t",header=T)

# removing objects from the workspace

#rm(x)

#x  # Error: object 'x' not found

# remove all objects from the workspace

rm(list=ls(all=TRUE))
