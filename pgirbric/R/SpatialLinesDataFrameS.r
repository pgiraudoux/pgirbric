 SpatialLinesDataFrameS<-function(lst,ID,df,proj4string = CRS(as.character(NA)),match.ID =FALSE){
  ID<-as.character(ID)
  lst<-lapply(lst,Line)
  for(i in 1:length(lst)) lst[[i]]<-Lines(lst[[i]],ID=ID[i])
  lst<-SpatialLines(lst,proj4string=proj4string)
  SpatialLinesDataFrame(lst,df,match.ID = match.ID)
}
