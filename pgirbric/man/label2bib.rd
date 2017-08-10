\name{label2bib}
\alias{label2bib}
\title{Add labels to a bibteX file}
\description{Add labels to a BiTeX file}

\usage{label2bib(bib,encoding="UTF-8",...)}

\arguments{
  \item{bib}{a BibTeX file.}
  \item{encoding}{encoding to be assumed for input strings (e.g. 'Latin-1' or 'UTF-8').}
  \item{...}{Additional arguments (e.g. to \code{\link[base]{readLines}})}
}

\details{
BiTeX files can be exported from some reference managers (e.g. Endnote) without label. label2bib add labels using the first author name collapsed with the publication year. In case of duplicates, a letter a, b, etc. is added.

The argument 'encoding' is used to mark character strings as known to be in Latin-1 or UTF-8: it is not used to re-encode the input. See \code{\link[base]{readLines}} for more details.
}

\value{ 
A new file with '_relab' added to the original file name.
}

\seealso{\code{\link[base]{readLines}}}


\keyword{utilities, file}

