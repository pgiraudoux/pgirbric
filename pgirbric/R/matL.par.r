matL.par<-function(matL1,adultage=4){
  sx<-diag(matL1[2:nrow(matL1),])

  n<-1000 # life esxpectancies
  for(i in 2:length(sx)) n<-c(n,n[i-1]*sx[i-1])
  lx<-(n[1:(length(n)-1)]+n[2:length(n)])/2
  Tx<-rep(NA,length(lx))
  for(i in 1:length(lx)) Tx[i]<-sum(lx[i:length(lx)])
  ex<-Tx/lx

  lambda=Re(eigen(matL1)$values[1])
  strage<-Re(eigen(matL1)$vectors[,1]/sum(eigen(matL1)$vectors[,1]))
  propImm=sum(strage[1:(adultage-1)]) # proportion d'immatures
  propAdu=sum(strage[adultage:length(strage)]) # proportion d'adultes
  list(sx=sx,ex=ex,lambda=lambda,strage=strage,propAdu=propAdu,propImm=propImm)
}