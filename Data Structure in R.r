
# integer
i <- 23
i

# string
s <- 'hello world'
s

# double
d <- 2.3
d

# boolean
b <- TRUE
b

# create a vector using the c function
v <- c(98, 99, 100)
v

v[1:2]

# create a vector from a range of integers
r <- (1:10)
r

r[5:10]

# add a new item to the end of a vector
v <- c(1, 2, 3)
v[4] <- 4
v


# create a list of named items
a <- list(aa=1, bb=2, cc=3)
a
a$aa
# add a named item to a list
a$dd=4
a

# Create a 2-row, 3-column matrix with named headings
data <- c(1, 2, 3, 4, 5, 6)
headings <- list(NULL, c("a","b","c"))

m <- matrix(data, nrow=2, ncol=3, byrow=TRUE, dimnames=headings)
m

m[1,]

m[,1]


# create a new data frame
years <- c(1980, 1985, 1990)
scores <- c(34, 44, 83)
df <- data.frame(years, scores)
df[,1]
df$years

# if then else
a <- 66
if (a > 55) {
print("a is more than 55")
} else {
print("A is less than or equal to 55")
}

# for loop
mylist <- c(55, 66, 77, 88, 99)
for (value in mylist) {
print(value)
}

# while loop
a <- 100
while (a < 500) {
a <- a + 100
}
a

numbers <- c(1, 2, 3, 4, 5, 6)
mean(numbers)

# function arguments
args(mean)
# example usage of the mean function
example(mean)
# define custom function
mysum <- function(a, b, c) {
sum <- a + b + c
return(sum)
}
# call custom function
mysum(1,2,3)

