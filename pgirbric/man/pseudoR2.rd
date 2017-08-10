\name{pseudoR2}
\alias{pseudoR2}
\title{Computes a peudo-R2 coefficient}
\description{Computes a peudo-R2 coefficient (ratio of total deviance explained by a glm model) }

\usage{pseudoR2(mod)}

\arguments{
  \item{mod}{object of class glm}
}

\details{
the pseudo-R2 is: (null deviance - sum of squared residuals)/null deviance
}

\value{ 
the value of the pseudo-R2
}

\seealso{  \code{\link[stats]{glm}}}

\examples{
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())

pseudoR2(glm.D93)  # 51.5% of the total deviance is explained by the model

}

\keyword{htest}

