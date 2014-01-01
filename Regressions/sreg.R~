# sreg_clust.R v1.0.0            damiancclarke             yyyy-mm-dd:2013-12-15
#---|----1----|----2----|----3----|----4----|----5----|----6----|----7----|----8
#
# script which simulates data with cluster specific unobservables.  A regression
# function is written where fixed effects are included, and standard errors are
# clustered to account for the clustr specific unobservables.

rm(list=ls())

#*******************************************************************************
#*** (1) Simulate data
#*******************************************************************************
X <- floor(runif(100,0,10))
u <- rnorm(100)
y <- 2*X + u

#*******************************************************************************
#*** (2) Define regression function and run regression
#*******************************************************************************
sreg <- function(y,X) {
  N <- length(y)
  X <- cbind(seq(1,1,length.out=100),X)
  k <- dim(X)[2]
  
  beta <- solve(t(X)%*%X, t(X)%*%y)
  
  yhat <- X%*%beta
  uhat <- yhat - y
  sigma <- sum(u%*%u)/(N-k)
  vmat <- sigma^2*solve(t(X)%*%X)
  se <- diag(vmat)
  
  return(cbind(beta,se))
}

reg.results <- sreg(y,X)

#*******************************************************************************
#*** (3) plot results
#*******************************************************************************
plot(X,y)
ypred<-reg.results[1]+reg.results[2]*X
lines(X,ypred, type="l")
title(main="Fitted OLS regression results")