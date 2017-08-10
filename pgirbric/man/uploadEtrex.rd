\name{uploadEtrex}
\alias{uploadEtrex}

\title{Upload waypoints to Garmin Etrex Summit GPS }
\description{
 Upload waypoints to Garmin Etrex Summit GPS, using gpsbabel
}
\usage{
uploadEtrex(gpx, wcom=4,type="w")
}

\arguments{
  \item{gpx}{name of the .gpx file (can be created from a data frame using \code{\link[pgirmess]{writeGPX}})}
  \item{wcom}{COM serial port number (Windows only), default to 4}
  \item{type}{'w' for waypoints (default), 't' for track}
}
\details{
  This function uploads waypoints or a track to a garmin GPS Etrex summit from a '.gpx' file. gpsbabel is called via the system. Therefore gpsbabel must be installed and on the user's path,  see \url{http://www.gpsbabel.org/}. The argument 'wcom' is used on Windows only. Works on Linux and Windows.
}

\section{Warning }{
Overwrite waypoints having the same name in the GPS
}

\seealso{ \code{\link[pgirmess]{writeGPX}}, \code{\link[pgirmess]{uploadGPS}}}

\examples{

\dontrun{
coords<-data.frame(ID=c("C18J01", "C18J02"),Long= c(-46.996602, 47.002745),
Lat=c(-6.148734, 6.14829),Alt=c(250,1230))
writeGPX(coords,"mywaypoints")
uploadEtrex("mywaypoint.gpx") # upload waypoints 
#(don't forget to set up the COM port number on Windows)
}

}

\keyword{IO}
\keyword{connection}
