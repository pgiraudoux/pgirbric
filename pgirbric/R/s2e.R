s2e<-function(sx,tab=FALSE){
  years<-500
  tabsurv<-matrix(ncol=5,nrow=years)
  colnames(tabsurv)<-c("year","n","lx","Tx","ex")
  tabsurv[,1]<-1:nrow(tabsurv)
  tabsurv[1,2]<-1000
  for(i in 2:nrow(tabsurv)) tabsurv[i,2]<- tabsurv[i-1,2]*sx # calcul de n
  for(i in 1:(nrow(tabsurv)-1)) tabsurv[i,3]<-(tabsurv[i,2]+tabsurv[i+1,2])/2 # calcul de lx
  for(i in 1:(nrow(tabsurv)-1)) tabsurv[i,4]<- sum(tabsurv[i:(nrow(tabsurv)-1),3])
  tabsurv[,5]<-tabsurv[,4]/tabsurv[,3]
  if(tab) tabsurv else  as.vector(tabsurv[1,5])
}