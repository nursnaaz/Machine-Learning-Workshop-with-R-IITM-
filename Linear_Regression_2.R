rm(list=ls(all=TRUE))
data<-read.csv("winequality-red.csv",header=T)
str(data)
summary(data)



#Split the data into train and test data sets
rows=seq(1,nrow(data),1)
set.seed(123)
trainRows=sample(rows,(70*nrow(data))/100)
train = data[trainRows,] 
test = data[-trainRows,]

# Build linear regression and interpret the results
#Input all attributes into model 
LinReg<- lm(quality ~ ., data=data)
summary(LinReg)
#Input attributes by selection
LinReg1<-lm(quality~volatileacidity+chlorides+totalsulfurdioxide+sulphates+alcohol, data=data)
summary(LinReg1)

# compare the models with limited atttributes and all attributes
summary(LinReg)
summary(LinReg1)





#Input all attributes into model 
LinReg3<- lm(quality ~ ., data=train)
summary(LinReg3)

# Error metrics evaluation on train data and test data
library(DMwR)
#Error verification on train data
regr.eval(train$quality, LinReg3$fitted.values) 
#Error verification on test data
Pred<-predict(LinReg3,test)
regr.eval(test$quality, Pred)
