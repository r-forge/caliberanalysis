\name{as.drugdose_lookups}
\alias{as.drugdose_lookups}
\alias{drugdose_lookups}

\title{
Import or convert a drugdose_lookups table
}

\description{
Converts its argument into an object of the class
drugdose_lookups for use by the dose conversion algorithm.
}

\usage{
as.drugdose_lookups(lookups)
}

\arguments{
  \item{lookups}{
Either a drugdose_lookups object (in which case it is returned unchanged),
a data.frame, data.table or filename of a csv file in the appropriate format,
see 'Details' below.
}
}

\details{

}

\value{
A data.table with class 'drugdose_lookups'.
}

\references{
Shah AD, Martinez C. An algorithm to derive a numerical daily dose
from unstructured text dosage instructions.
Pharmacoepidemiol Drug Saf 2006; 15(3): 161–166. doi: 10.1002/pds.1151
\url{http://onlinelibrary.wiley.com/doi/10.1002/pds.1151/}
}

\author{
Anoop Shah
}

\seealso{
\code{\link{as.drugdose_singlewords}}, \code{\link{as.drugdose_multiwords}}
\code{\link{as.drugdose_patterns}}, \code{\link{as.drugdose_lookups}},
\code{\link{export}}, \code{\link{addterm}}
}

\examples{

}