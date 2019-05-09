\name{matL}
\alias{matL}

\title{Create a Leslie matrix}
\description{Create a Leslie matrix based on vectors of age specific survival and fecondity}

\usage{matL(sx=c(0.845,rep(0.9328333,25-1)),bx=c(0,0,0,rep(0.25/2,25-3)))}

\arguments{
  \item{sx}{a vector of age-specific survival}
  \item{bx}{a vector of age-specific average number of offspring}
}

\details{

Construct a Leslie matrix based on age-specific survival (sx) and age specific number of offspring produced per year (bx). sx and bx must have the same length. (e.g. using \code{\link[rgeos]{gIntersection}}). Age specific fecondity (sx*bx) is computed internally.
}

\value{ 
A k x k age-classified demographic projection matrix.
}

\references{
\url{https://en.wikipedia.org/wiki/Leslie_matrix}
}

\seealso{
\code{\link[pgirbric]{matL.par},\link[demogR]{leslie.matrix}}
}


\examples{

matL1<-matL() # Leslie matrix with the default values

tmax<-100 # run on 100 years
pop<-matrix(1,nrow=ncol(matL1),ncol=tmax )
pop[,1]<-rep(60/25,nrow(matL1)) # initiating the first year 
                                # with a population of 60 individuals 
                                # each age-category have the same number of individuals
for (i in 2:tmax) pop[,i]<-matL1\%*\%pop[,i-1] # computing population variations 
plot(1:tmax,colSums(pop), type="l",xlab="years",ylab="N",las=1,
main="Population size variation")

}


\keyword{survival}

