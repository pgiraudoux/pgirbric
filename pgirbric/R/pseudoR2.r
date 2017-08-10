pseudoR2<-function(mod) {
   x<-summary(mod)
   (x$null.deviance-sum(x$deviance.res^2))/x$null.deviance
} 