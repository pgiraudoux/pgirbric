matL<-function(sx=c(0.845,rep(0.9328333,25-1)),bx=c(0,0,0,rep(0.25/2,25-3))){
  sx<-sx # age specific survival
  bx<-bx # number of offspring by female in each age class
  sxbx<-sx*bx # computing age specific fertility
  matLeslie<-matrix(0,nrow=length(sx),ncol=length(sx)) 
  matLeslie[1,]<-sxbx # first row: fertrility
  diag(matLeslie[2:nrow(matLeslie),])<-sx[1:(length(sx)-1)] # survival
  attributes(matLeslie)$sx<-sx
  attributes(matLeslie)$bx<-bx
  matLeslie
}
