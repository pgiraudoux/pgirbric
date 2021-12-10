\name{readBaseCamp}
\alias{readBaseCamp}

\title{Read Garmin Basecamp (TM) export file}
\description{
 Read Garmin Basecamp (TM) export tab delimited text file into a data.frame
}
\usage{
readBaseCamp(file = "", type = "w")
}

\arguments{
  \item{file}{ the name of the Basecamp file which the data are to be read from }
  \item{type}{ "w" waypoints (default), or "t" track}
}
\details{

The function just extracts the coordinates and other variables of the table included in the verbose text export of Basecamp, and read it into a data.frame
  
}

\value{
  A data.frame
}


\seealso{ \code{\link[maptools]{readGPS}}, \code{\link[pgirbric]{readVista}}}


\keyword{IO}
\keyword{connection}
