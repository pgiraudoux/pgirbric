\name{label2bib}
\alias{label2bib}
\title{Add labels to a BibTeX file}
\description{Add labels to a BiTeX file}

\usage{label2bib(bib,encoding="UTF-8",stdout=FALSE,...)}

\arguments{
  \item{bib}{a BibTeX file.}
  \item{encoding}{encoding to be assumed for input strings (e.g. 'Latin-1' or 'UTF-8').}
  \item{stdout}{if TRUE send the result to the standard output (to console), if FALSE (the default) to a file (see value)}
  \item{...}{Additional arguments (e.g. to \code{\link[base]{readLines}} or \code{\link[base]{writeLines}}) }
}

\details{
BiTeX files can be exported from some reference managers (e.g. Endnote) without label. label2bib create and add labels using the first author name collapsed with the publication year. In case of duplicates, a letter a, b, etc. is added. BibTeX format should strictly conform to standard regarding authors e.g. Name(s) (each ending with coma) then First Name(s) separated by 'and'. Example : author = {DO, John and DUPOND, Marc}.

The argument 'encoding' is used to mark character strings as known to be in Latin-1 or UTF-8: it is not used to re-encode the input. See \code{\link[base]{readLines}} for more details.
}

\value{ 
By default (sdtout = FALSE), a new file with '_relab' added to the original file name. If stdout = TRUE, then the output is sent to console.
}

\seealso{\code{\link[base]{readLines}}, \code{\link[base]{writeLines}}}

\examples{

cat("@article{
  author = {Berthier, K. and Piry, S. and Cosson, J. F. and Giraudoux, 
  P. and Foltete, J. C. and Defaut, R. and Truchetet, D. and Lambin, X.},
  title = {Dispersal, landscape and travelling waves in cyclic vole populations},
  journal = {Ecology Letters},
  volume = {17},
  number = {1},
  pages = {53-64},
  year = {2014}
}

@book{
  author = {Clobert, J and Baguette, M and Benton, TG and Bullock, JM},
  title = {Dispersal ecology and evolution},
  publisher = {Oxford University Press},
  address = {Oxford, UK},
  year = {2012}
}", file="test.bib")


label2bib("test.bib",stdout=TRUE, warn=FALSE)

file.remove("test.bib")

}


\keyword{utilities}
\keyword{file}
