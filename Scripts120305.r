
path<-getwd()
load("U:/Documents and Settings/pgiraudo/Mes documents/TER Clemence/datasp2.Rdata")

  # initiatlisation de TRIM
initTRIM<-function(path=getwd()){
 path<-normalizePath(path)
 cat("Start\n",path,"\\\n1\n",file="C:/TRIM.STU",sep="")
 cat(path,"\\\n",path,"\\\n","1_1\n",sep="",file="TRIMSRT1.STU")
 }
 
 initTRIM()
 
 # préparation d'un fichier TRIM à partir d'un data.frame d'observations
 
as.trim<-function(df,miss=-1){
  df<-df[order(df[,1],df[,2]),]
  names(df)<-c("ID","time","n")
  sites<-unique(data.frame(IDint=as.numeric(df[,1]),IDSite=as.character(df[,1])))
  df[,1]<-as.numeric(df[,1])
  TRIM<-expand.grid(ID=unique(df[,1]),time=unique(df[,2]))
  TRIM<-merge(TRIM,df,all.x=TRUE)
  TRIM[,3][is.na(TRIM[,3])]<-miss
  attributes(TRIM)$sites<-sites
  attributes(TRIM)$class<-c("trim","data.frame")
  TRIM
}

x<-as.trim(datasp2)


