\name{matL.par}
\alias{matL.par}
\title{Extract values of interest from a Leslie matrix}
\description{Extract the age specific survival vector, the life expectancy at year 2, the stable instant growth (lambda),the stable proportion of immatures and adults, the stable age structure of the population from a Leslie matrix }

\usage{matL.par(matL1, adultage=4)}

\arguments{
  \item{matL1}{a Leslie matrix}
  \item{adultage}{the adult age (e.g. the first year of reproduction)}
}

\details{
See description.

}

\value{ 

A list with the followings items:
    \item{sx}{vector of survival}
    \item{ex}{life expectancy at year 2}
    \item{lambda}{the stable instant growth rate}
    \item{propImm}{the proportion of immatures}
    \item{propAdu}{the proportion of adults}
    \item{strage}{the stable age structure} 
}

\references{
\url{https://en.wikipedia.org/wiki/Leslie_matrix}
}

\seealso{
\code{\link[pgirbric]{matL},\link[pgirbric]{s2e}}
}


\examples{

matL1<-matL() # Leslie matrix with the default values
matL.par(matL1)

}


\keyword{survival}

