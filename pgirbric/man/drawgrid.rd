\name{drawgrid}
\alias{drawgrid}
\title{Graticule creator}
\description{Create a graticule from any spatial object having an extractable bounding box or from a "gmeta6" file }

\usage{drawgrid(spobj, le=1000,labels=TRUE,ofs=le/10)}

\arguments{
  \item{spobj}{any objet that have a bounding box extractable by \code{\link[sp]{bbox}} or an object of class "gmeta6", or a 2 x 2 matrix}
  \item{le}{length between to graticule lines}
  \item{labels}{if TRUE, computes labels coordinates, labels, and position specifiers}
  \item{ofs}{offset to place labels (used only when labels is TRUE)}
}

\details{
If a 2 x 2 matrix is provided,the first column has the minimum, the second the maximum values; the first row is the longitude and the second row the latitude
}

\value{ 

 If labels is TRUE, generates a list with the following elements:
 \item{spdf}{a \code{\link[sp]{SpatialPolygonsDataFrame}}}
 \item{labcoords}{a matrix with the label coordinates}
 \item{labs}{a numeric vector with the labels}
 \item{pos}{a numeric vector with the label position specifiers (see \code{\link[graphics]{text})}}

 If labels is FALSE, returns a \code{\link[sp]{SpatialPolygonsDataFrame}} object
}

\seealso{ \code{\link[sp]{bbox}}, \code{\link[spgrass6]{gmeta6}},  \code{\link[graphics]{text}}, \code{\link[sp]{over}}}

\examples{


library(sp)
data(meuse.grid)
coordinates(meuse.grid)<-~x+y
gridded(meuse.grid)<-TRUE

mygratic<-drawgrid(meuse.grid,le=500) # using a spatial object
plot(mygratic[[2]],type="n",xaxt="n",yaxt="n",bty="n",xlab="",ylab="",asp=1)
image(meuse.grid,add=TRUE)
text(mygratic[[2]],labels=round(mygratic[[3]]/1000,1),cex=0.7,pos=(mygratic[[4]]))
plot(mygratic[[1]],add=TRUE,border="grey")


mymatrix<-bbox(meuse.grid) # using a matrix
mygratic<-drawgrid(mymatrix,le=500)
plot(mygratic[[2]],type="n",xaxt="n",yaxt="n",bty="n",xlab="",ylab="",asp=1)
image(meuse.grid,add=TRUE)
text(mygratic[[2]],labels=round(mygratic[[3]]/1000,1),cex=0.7,pos=(mygratic[[4]]))
plot(mygratic[[1]],add=TRUE,border="grey")


}

\keyword{spatial}

