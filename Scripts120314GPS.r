x<-readLines("essai_120229.txt")


idx<-grep("wpt",x)
deb<-idx[x[idx-1]==""]+1
idx<-grep("rtept",x)
end<-idx[x[idx-1]==""]-1-1



read.delim("essais.txt")

file<-"essai_120229.txt"

readBasecamp<-function(file="",type="w") {
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

readBasecamp("essai_120229.txt")
readBasecamp("essai_120229.txt",type="t")
readBasecamp("track_GPS_map62s.txt",type="t")
readBasecamp("track_GPS_map62s.txt",type="w")

tmp<-readOGR("Orliers.gpx",layer="waypoints")

writeOGR(tmp,"tmp.gpx","waypoints",driver="GPX")


readOGR("Current.gpx",layer="tracks")

# Waypoints_08-NOV-11.gpx