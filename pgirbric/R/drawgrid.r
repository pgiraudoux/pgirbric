
drawgrid<-function(spobj, le=1000,labels=TRUE,ofs=le/10){
	
	if(is.matrix(spobj)){
		if (!identical(dim(spobj),as.integer(c(2,2)))) stop("Matrix dimensions must be 2 x 2")
		if(spobj[1,1]>=spobj[1,2] | spobj[2,1]>=spobj[2,2]) stop("Non conform coordinates: first column must be lower latitude/longitude, second column higher latitude/longitude")
			x<-seq(spobj[1,1],spobj[1,2],by=le)
			y<-seq(spobj[2,2],spobj[2,1],by=-le)
	}
	else
	{
	essais<-try(bbox(spobj),silent=TRUE)
	if (!inherits(essais,"try-error")){
	x<-seq(bbox(spobj)[1,1],bbox(spobj)[1,2],by=le)
	y<-seq(bbox(spobj)[2,2],bbox(spobj)[2,1],by=-le)
	} 
	else {
	if (inherits(spobj,"gmeta6")){
	x<-seq(spobj$w,spobj$e,by=le)
	y<-seq(spobj$n,spobj$s,by=-le)
	} else stop('spobj must have a bounding box or be of class "gmeta6".')
	}
	}
	
  g<-expand.grid(x=x[1:length(x)],y=y[1:length(y)])
  pl<-rep(list(NA),nrow(g))
  for (i in 1:nrow(g)){
  pl[[i]]<-Polygons(list(Polygon(rbind(g[i,], c(g[i,1]+le,g[i,2]), c(g[i,1]+le,g[i,2]-le), c(g[i,1],g[i,2]-le), g[i,]))),i)
  }
  spdf<-SpatialPolygonsDataFrame(SpatialPolygons(pl),data=g)
  if (!labels)
	spdf
	else
	labcoords<-rbind(cbind(c(x,max(x)+le),min(y)-le-ofs),cbind(min(x)-ofs,c(y,min(y)-le)),cbind(c(x,max(x)+le),max(y)+ofs),	cbind(max(x)+le+ofs,c(y,min(y)-le)))
	labs<-rep(c(x,max(x)+le,y,min(y)-le),2)
	pos<-c(rep(1,length(x)+1),rep(2,length(y)+1),rep(3,length(x)+1),rep(4,length(y)+1))
	list(spdf=spdf, labcoords=labcoords,labs=labs,pos=pos)
}
