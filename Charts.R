#Histogram
# load the data
data(iris)
# create histograms for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  hist(iris[,i], main=names(iris)[i])
}

#density plots
# load packages
library(lattice)
# load dataset
data(iris)
# create a layout of simpler density plots by attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  plot(density(iris[,i]), main=names(iris)[i])
}

#Box and Whiskers
# load dataset
data(iris)
# Create separate boxplots for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(iris[,i], main=names(iris)[i])
}

$Bar Plots
# load the package
library(mlbench)
# load the dataset
data(BreastCancer)
# create a bar plot of each categorical attribute
par(mfrow=c(2,4))
for(i in 2:9) {
  counts <- table(BreastCancer[,i])
  name <- names(BreastCancer)[i]
  barplot(counts, main=name)
}


#Correlation

# load package
library(corrplot)
# load the data
data(iris)
# calculate correlations
correlations <- cor(iris[,1:4])
# create correlation plot
corrplot(correlations, method="circle")


#Scatter Plots
# load the data
data(iris)
# pairwise scatter plots of all 4 attributes
pairs(iris)


#Scatter plot Matrix By Class
# load the data
data(iris)
# pairwise scatter plots colored by class
pairs(Species~., data=iris, col=iris$Species)




#Density Plots By Class

# load the package
library(caret)
# load the data
data(iris)
# density plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)