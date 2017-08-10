\name{SpatialLinesDataFrameS}
\alias{SpatialLinesDataFrameS}
\title{Creates a SpatialLinesDataFrame object from a list of lines}
\description{Creates a SpatialLinesDataFrame object from a list of lines}
\usage{SpatialLinesDataFrameS(lst,ID,df,proj4string = CRS(as.character(NA)),match.ID =FALSE)}

\arguments{
  \item{lst}{ list of two colomns matrices representing the coordinates of line nodes (longitude,latitude) }
  \item{ID}{ line names: name of each line (coerced to character vector)}
  \item{df}{ object of class \code{\link[base]{data.frame}}; the number of rows in 'data' should equal the number of elements in 'lst'}
  \item{proj4string}{Object of class \code{\link[sp]{CRS}} holding a valid proj4 string}
  \item{match.ID}{logical: (default FALSE): match SpatialLines member Lines ID slot values with data frame row names, and re-order the data frame rows if necessary}
}

\details{
This function is a rapid way to creates a \code{\link[sp]{SpatialLinesDataFrame}} from a simple list of line nodes coordinates and a data.frame
}

\value{A \code{\link[sp]{SpatialLinesDataFrame}} class object}

\seealso{ \code{\link[sp]{Line}}, \code{\link[sp]{Lines}},\code{\link[sp]{SpatialLines}}}

\examples{

library(sp)

# lines coordinates
lineA<-matrix(c(-0.9, -0.7, -0.5, -0.3, -0.1, 0.5, 0.3, 0.2, 0.3,0.3),ncol=2)
lineB<-matrix(c(0, 0.2, 0.6, 0.8, 0, -0.1, 0.1, -0.1),ncol=2)
lineC<-matrix(c(-0.6, -0.4, -0.3, -0.1, 0, -0.3, -0.1, -0.6, -0.7,-0.6),ncol=2)

lst<-list(lineA=lineA,lineB=lineB,lineC=lineC)

# sample dataframe
df<-data.frame(names=names(lst),values=rpois(3,10))

mylines<-SpatialLinesDataFrameS(lst,ID=names(lst),df)

plot(mylines)


}


\keyword{spatial}

