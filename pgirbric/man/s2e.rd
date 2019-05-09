\name{s2e}
\alias{s2e}
\title{Compute life expectancy from a survival}
\description{Compute life expectancy from a survival}

\usage{s2e(sx,tab=FALSE)}

\arguments{
  \item{sx}{a survival [0,1]}
  \item{tab}{if  FALSE (default) the output is the life expectancy, if TRUE, a life table}
}

\details{
Gives the life expectancy corresponding to a survival, or optionally the corresponding life table (nrow = 500)
}

\value{ 
A numeric value or a data.frame.
}


\examples{

s2e(0.98)
s2e(0.98, tab=TRUE)
}

\keyword{survival}

