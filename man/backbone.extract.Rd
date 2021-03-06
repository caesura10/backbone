% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backbone.extract.R
\name{backbone.extract}
\alias{backbone.extract}
\title{Extracts the backbone of a weighted network using results from a null model}
\usage{
backbone.extract(
  backbone,
  signed = TRUE,
  alpha = 0.05,
  fwer = "none",
  class = "original",
  narrative = FALSE
)
}
\arguments{
\item{backbone}{backbone: backbone S3 class object, as returned by \link{bipartite.null}.}

\item{signed}{Boolean: TRUE if signed backbone is to be returned, FALSE if binary backbone is to be returned}

\item{alpha}{Real: significance level of hypothesis test(s)}

\item{fwer}{string: type of familywise error rate correction to be applied; c("none","bonferroni",holm"). If "holm", Holm Bonferroni Family-wise Error Rate test is used,
if "bonferroni", Bonferroni Family-wise Error Rate test should be used.
By default, the given 'alpha' value is used for all tests with no correction for family-wise error rates.}

\item{class}{string: the class of the returned backbone graph, one of c("original", "matrix", "sparseMatrix", "igraph", "network", "edgelist"), converted via \link{class.convert}.
If "original", the backbone graph returned is of the same class as the data inputted in \link{bipartite.null}.}

\item{narrative}{Boolean: TRUE if suggested text for a manuscript is to be returned}
}
\value{
backbone graph: Binary or signed backbone graph of class given in parameter `class`.
}
\description{
`backbone.extract` returns a binary or signed adjacency matrix
     containing the backbone that retains only the significant edges.
}
\details{
The "backbone" S3 class object is composed of two matrices, a summary dataframe and (optionally, if generated by using \link{fdsm}) a 'dyad_values' vector.
    This object is returned by \link{bipartite.null}, or alternatively if a null model was called directly, \link{sdsm}, \link{fdsm}, or \link{hyperg}.

The Holm Bonferroni correction was originally a port from python code written by \href{ https://github.com/saref}{Dr. Samin Aref}.
    The authors thank Dr. Aref greatly for his contribution to this package!
}
\examples{
probs <- bipartite.null(davis, rows = TRUE, cols = TRUE)
bb <- backbone.extract(probs, alpha = .2, signed = TRUE, fwer = "none")
}
