label2bib<-function(bib,encoding="UTF-8",stdout=FALSE,...) {

myFile<-readLines(bib,encoding=encoding,...)

 ### extraction 1er auteur
idrec<-grep("@",myFile)
myFile[idrec+1]
idac<-unlist(gregexpr("{",myFile[idrec+1],fixed=TRUE))
idcom<-sapply(gregexpr(",",myFile[idrec+1],fixed=TRUE),function(x) x[1])
aut1<-substr(myFile[idrec+1],idac+1,idcom-1)

 ### extraction annee

idan<-grep("year = {",myFile,fixed=TRUE)
idac2<-unlist(gregexpr("{",myFile[idan],fixed=TRUE))
year<-substr(myFile[idan],idac2+1,idac2+4)

mylabel<-paste(aut1,year,sep="")

 ### detection et traitement des duplicatas

#mylabel2<-c(mylabel[1],mylabel,mylabel[11])
iddupli<-duplicated(mylabel)
if(any(iddupli)) {
  for(i in mylabel[iddupli]) {
    tmp<-mylabel[mylabel==i]
    print(paste(tmp,letters[1:length(tmp)],sep=""))
    mylabel[mylabel==i]<-paste(tmp,letters[1:length(tmp)],sep="")
  }
}

# ecriture des labels
idac3<-unlist(gregexpr("{",myFile[idrec],fixed=TRUE))

myFile[idrec]<-paste(substr(myFile[idrec],1,idac3),mylabel,",",sep="")

if (stdout) writeLines(myFile,useBytes=TRUE) else {
  idpt<-gregexpr(".",bib,fixed=TRUE)
  if(idpt[[1]][1]>0) filename<-paste(substr(bib,1,idpt[[1]][1]-1),"_relab",substr(bib,idpt[[1]],nchar(bib)),sep="") else filename<-paste(bib,"_relab",sep="")
  writeLines(myFile,filename,useBytes=TRUE)
}

}
