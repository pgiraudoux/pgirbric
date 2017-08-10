\name{SpatialPolygonsDataFrameS}
\alias{SpatialPolygonsDataFrameS}
\title{Creates a SpatialPolygonsDataFrame object from a list of lines}
\description{Creates a SpatialPolygonsDataFrame object from a list of lines}
\usage{SpatialPolygonsDataFrameS(lst,ID,df,proj4string = CRS(as.character(NA)),match.ID =FALSE)}

\arguments{
  \item{lst}{ list of two colomns matrices representing the coordinates of boundary nodes (longitude,latitude) }
  \item{ID}{ polygon names: name of each line (coerced to character vector) }
  \item{df}{ object of class \code{\link[base]{data.frame}}; the number of rows in 'data' should equal the number of elements in 'lst'}
  \item{proj4string}{Object of class \code{\link[sp]{CRS}} holding a valid proj4 string}
  \item{match.ID}{logical: (default FALSE): match SpatialPolygons member Polygons ID slot values with data frame row names, and re-order the data frame rows if necessary}
}

\details{
This function is a rapid way to creates a \code{\link[sp]{SpatialPolygonsDataFrame}} from a simple list of boundary nodes coordinates and a data.frame
}

\value{A \code{\link[sp]{SpatialPolygonsDataFrame}} class object}

\seealso{ \code{\link[sp]{Polygon}}, \code{\link[sp]{Polygons}},\code{\link[sp]{SpatialPolygons}}}

\examples{

library(sp)

# boundary coordinates
polyA<-matrix(c(877471, 883320, 887086, 885804, 881878, 878833, 877471, 2266903, 
2270108, 2265141, 2259932, 2260573, 2264259, 2266903),ncol=2)
polyB<-matrix(c(877712, 878192, 888849, 893897, 889009, 884282, 881237, 877712,
2258410, 2249677, 2249356, 2255766, 2256808, 2254003, 2257849, 2258410
),ncol=2)

lst<-list(poly1=polyA,polyB=polyB)

# sample dataframe
df<-data.frame(names=names(lst),values=rpois(2,10))

mypoly<-SpatialPolygonsDataFrameS(lst,ID=names(lst),df)

plot(mypoly)


}


\keyword{spatial}

