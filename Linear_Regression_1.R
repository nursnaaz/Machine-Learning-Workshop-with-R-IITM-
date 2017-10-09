rm(list=ls(all=TRUE))
data=read.csv("CustomerData.csv",header=T)
str(data)
summary(data)
# Preprocessing 

# remove CustomerID column
data = data[,-1]

# convert City attribute as factor
data$City = as.factor(as.character(data$City))

dataForModel = data

#Split the data into train and test data sets
rows=seq(1,nrow(dataForModel),1)
set.seed(123)
trainRows=sample(rows,(70*nrow(dataForModel))/100)
train = dataForModel[trainRows,] 
test = dataForModel[-trainRows,]

# Build linear regression and interpret the results
#Input attributes by selection
LinReg=lm(TotalRevenueGenerated~City+NoOfChildren+ Tenure+NoOfUnitsPurchased, data=dataForModel)
summary(LinReg)

#Input all attributes into model 
LinReg1= lm(TotalRevenueGenerated ~ ., data=dataForModel)
summary(LinReg1)
# compare the models with limited atttributes and all attributes
summary(LinReg)
summary(LinReg1)

# Build model with significant attributes
LinReg2=lm(TotalRevenueGenerated~City+NoOfChildren+ MinAgeOfChild+
              FrquncyOfPurchase+NoOfUnitsPurchased+FrequencyOFPlay+NoOfGamesPlayed
            +NoOfGamesBought+FavoriteChannelOfTransaction+FavoriteGame, data=dataForModel)
summary(LinReg2)

# Build model with significant attributes
LinReg3=lm(TotalRevenueGenerated~City+MinAgeOfChild+
              FrquncyOfPurchase+NoOfUnitsPurchased+FrequencyOFPlay+
            NoOfGamesBought+FavoriteChannelOfTransaction, data=dataForModel)
summary(LinReg3)

# Model without intercept
LinReg_NoIntercept=lm(TotalRevenueGenerated~0+City+NoOfChildren+ Tenure+NoOfUnitsPurchased, data=train)
summary(LinReg_NoIntercept)

#Input all attributes into model 
LinReg3= lm(TotalRevenueGenerated ~ ., data=train)
summary(LinReg3)

LinReg4= lm(TotalRevenueGenerated~City+MinAgeOfChild+
  FrquncyOfPurchase+NoOfUnitsPurchased+FrequencyOFPlay+
  NoOfGamesBought+FavoriteChannelOfTransaction,data=train)
summary(LinReg4)

# Error metrics evaluation on train data and test data
library(DMwR)
#Error verification on train data
regr.eval(train$TotalRevenueGenerated, LinReg4$fitted.values) 
#Error verification on test data
Pred=predict(LinReg4,test)
regr.eval(test$TotalRevenueGenerated, Pred)


# Perform multicollinearity and dimensionality reduction analysis
#Multicollinearity check ( to drop the attributes with high VIF value : to reduce dimentionality - dimentionality reduction)
library(car)
vif(LinReg1)

# Stepwise Regression
library(MASS)
step <- stepAIC(LinReg1, direction="both")

