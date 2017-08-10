\name{readEtrex}
\alias{readEtrex}

\title{Download Garmin Etrex summit GPS waypoints and tracks}
\description{
 Download Garmin Etrex summit GPS waypoints and tracks using gpsbabel
}
\usage{
readEtrex(type = "w", wcom = 4)
}

\arguments{
  \item{type}{ "w" to download waypoints (the default), "t" to download tracks }
  \item{wcom}{ COM serial port number (Windows only)}
}
\details{
  This function calls gpsbabel commands via the system. Therefore gpsbabel must have been previously installed,  see <http://www.gpsbabel.org/>. 
  It is expected to work on Linux as well as on Windows plateform. The argument 'wcom' is used on Windows only. 
  Download is quite slow (about 19.5 readings per second) however no more than with other GPS downloaders.
  Information about the data type (waypoints or tracks) and the download date are stored as attributes. A more general function \code{\link[maptools]{readGPS}} with substantial differences in the code has been included in the maptools package.
}

\value{
  A data.frame with the following columns:
  \item{ident }{waypoint names (waypoint) or number (track)}
  \item{longitude }{longitude in decimal degrees}
  \item{latitude }{latitude in decimal degrees}
  \item{altitude }{altitude in meters}
}

\author{ Patrick Giraudoux with Roger Bivand's support }

\seealso{ \code{\link[maptools]{readGPS}}, \code{\link[pgirmess]{readVista}}}

\examples{

\dontrun{
mywaypoints<-readEtrex() # download waypoints
mytracks<-readEtrex(type="t") # download tracks
}

}

\keyword{IO}
\keyword{connection}
