
readBaseCamp<-function(file="",type="w") {
  if(!type%in%c("w","t")) stop("type must be 'w' (waypoints) or 't' (track)")
  tmp <- tempfile(pattern = "Basecamp")
  x<-readLines(file)
  if (type=="w"){
    idx<-grep("wpt",x)
    deb<-idx[x[idx-1]==""]+1
    idx<-grep("rtept",x)
    end<-idx[x[idx-1]==""]-1-1
    for(i in deb:end) cat(x[i],"\n",file=tmp,append=TRUE)
    read.delim(tmp)
  }
  else{
    idx<-grep("trkpt",x)
    deb<-idx[x[idx-1]==""]+1
    idx<-grep("Category",x)
    end<-idx[x[idx-1]==""]-1-1
    for(i in deb:end) cat(x[i],"\n",file=tmp,append=TRUE)
    read.delim(tmp)
  }
  
}