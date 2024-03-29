\name{thintrack2}
\alias{thintrack2}

\title{ Thin a track just keeping the points separated by a user defined minimal distance }
\description{
  Thin a track stored as a \code{\link[sp]{SpatialPointsDataFrame}} object, just keeping the points separated by a user defined minimal distance
}
\usage{
thintrack2(spdf,mindist=100)
}

\arguments{
  \item{spdf}{a \code{\link[sp]{SpatialPointsDataFrame}} of point tracks }
  \item{mindist}{ minimal distance requested between two points (defaut = 100)}

}
\details{
Tracks downloaded from GPS often provide an unecessary large density of points at irregular distances. This function starts reading from the first point of the track and remove all points within a user specified  minimal distance (USMD), then reads the next point located at a distance equal or larger than the USMD and removes all points within the USMD, and so on...
  }
\value{
  a \code{\link[sp]{SpatialPointsDataFrame}} with the track thinned.
}

\seealso{ \code{\link[pgirmess]{mergeTrackObs}},\code{\link[pgirbric]{thintrack}} }

\examples{

library(sp)
mySPDF<-structure(list(x = c(748775, 748807, 748834, 748854, 748871, 
748873, 748880, 748910, 748919, 748917, 748921, 748923, 748924, 
748921, 748921, 748921, 748922, 748915, 748616, 748613, 748612, 
748613, 748613, 748615, 748613, 748616, 748615, 748618, 748615, 
748619, 748618, 748620, 748586, 748553, 748494, 748444, 748424, 
748366, 748305, 748305), y = c(105716, 105761, 105808, 105856, 
105911, 105964, 106019, 106065, 106114, 106167, 106219, 106274, 
106329, 106385, 106441, 106494, 106550, 106571, 105835, 105779, 
105723, 105665, 105600, 105537, 105473, 105412, 105350, 105293, 
105234, 105180, 105123, 105070, 105023, 104960, 104956, 104947, 
104906, 104905, 104901, 104904), ID = 1:40), .Names = c("x", 
"y", "ID"), row.names = c("1", "2", "3", "4", "5", "6", "7", 
"8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", 
"19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", 
"30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"
), class = "data.frame")
coordinates(mySPDF)<-~x+y

plot(mySPDF,pch=19,cex=0.5)
plot(thintrack2(mySPDF),pch=19,cex=0.7,col="red",add=TRUE)

plot(mySPDF,pch=19,cex=0.5)
plot(thintrack2(mySPDF,min=200),pch=19,cex=0.7,col="red",add=TRUE)

}

\keyword{ spatial }
