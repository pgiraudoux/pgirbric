matL.par<-function(matL1,adultage=4){
  sx<-diag(matL1[2:nrow(matL1),])
  ex<-as.vector(s2e(matL1[3,2]))
  lambda=Re(eigen(matL1)$values[1])
  strage<-Re(eigen(matL1)$vectors[,1]/sum(eigen(matL1)$vectors[,1]))
  propImm=sum(strage[1:(adultage-1)]) # proportion d'immatures
  propAdu=sum(strage[adultage:length(strage)]) # proportion d'adultes
  list(sx=sx,ex=ex,lambda=lambda,propImm=propImm,propAdu=propAdu,strage=strage)
}