#source code: https://github.com/cran/gamlss.dist/blob/master/R/BEINF0.R

install.packages("gamboostLSS")
library(gamboostLSS)

install.packages('Metrics')
library(Metrics)

install.packages('gamlss.dist')
library(gamlss.dist)

train = read.csv('C:\\Users\\mayuh\\OneDrive - Nanyang Technological University\\22GIS\\report\\train_new.csv')
test = read.csv('C:\\Users\\mayuh\\OneDrive - Nanyang Technological University\\22GIS\\report\\test_new.csv')

head(train)

train$X = NULL
train$file_origin = NULL
train$X4_49653612.49665611 = NULL
test$X = NULL
test$file_origin = NULL
test$X4_49653612.49665611 = NULL

#set.seed(205)
#grid = make.grid(max = c(mu = 10, sigma = 250, nu = 250), min = 20, dense_mu_grid = FALSE)
#folds = cv(model.weights(mod), type = "kfold")
#cvr = cvrisk(mod, grid = grid, folds = folds)
#cvr

ctrl1 = boost_control(mstop = c(mu = 10, sigma = 250, nu = 250), nu = c(mu = 0.2, sigma = 0.01, nu = 0.01))
ctrl2 = boost_control(mstop = c(mu = 500, sigma = 250, nu = 250), nu = c(mu = 0.2, sigma = 0.01, nu = 0.01))
mod1 = glmboostLSS(fraction ~ ., data = train, families = as.families(BEINF0(mu.link = "logit", sigma.link = "logit", nu.link = "log")), control=ctrl1)
mod2 = glmboostLSS(fraction ~ ., data = train, families = as.families(BEINF0(mu.link = "logit", sigma.link = "logit", nu.link = "log")), control=ctrl2)
summary(mod1)
coef(mod1)

#str(BEINF0(),1)

pred_train = predict(mod2, newdata = train, type = "response")$mu/(1+predict(mod, newdata = train, type = "response")$nu)
pred_test = predict(mod2, newdata = test, type = "response")$mu/(1+predict(mod, newdata = test, type = "response")$nu)

mae(pred_train, train$fraction)
cor(pred_train, train$fraction)

mae(pred_test, test$fraction)
cor(pred_test, test$fraction)

plot(train$fraction, pred_train, xlim = c(0,0.9), ylim = c(0,0.9),
     xlab = "Observed ctDNA Fraction", ylab = "Predicted ctDNA Fraction",
     pch = 19, frame = TRUE, cex = 0.8)
abline(a=0, b=1, col='blue')

plot(test$fraction, pred_test, xlim = c(0,0.9), ylim = c(0,0.9),
     xlab = "Observed ctDNA Fraction", ylab = "Predicted ctDNA Fraction",
     pch = 19, frame = TRUE, cex = 0.8)
abline(a=0, b=1, col='blue')

a = c(132088994,94314325,156816884,47946656,82259254,158417348,195162112)
a+5750

b = c(60637656,56388466,25518377,50466336,107430239)
b+5750

5:132094744 
11:94320075
2:156822634
11:47952406
5:82265004
2:158423098
3:195167862

20:60637656
12:56388466
20:25518377
20:50466336
13:107430239

