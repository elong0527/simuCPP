% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simuCPP.R
\docType{package}
\name{simuCCP}
\alias{simuCCP}
\title{simuCCP package documentation}
\usage{
simuCCP(
  N,
  metric = "Cind",
  value = 0.7,
  family = c(1, 3, 4),
  c0 = 0.5,
  fam2 = NULL,
  par2 = NULL
)
}
\arguments{
\item{N}{sample size}

\item{metric}{simulate metric (C-index, iAUC, AUC)}

\item{value}{of therotical value of (C-index, iAUC, AUC)}

\item{family}{d - 1 dimension of copula family, where d is number of covariates check \code{BiCopPar2Tau} for detail.}

\item{c0}{prevalence; cutoff point of latent uniform parameter (Used in AUC)}

\item{fam2}{higher order copula family ( dimension: (d^2 - 3d + 2)/2 ) (default: conditional independent)}

\item{par2}{parameters of higher order copula family ( dimension: (d^2 - 3d + 2)/2 ) (default: all 0)}
}
\description{
This function generate multivariate uniform distribution with designed copula family and
therotical Concordance probability (C-index, iAUC, AUC)
}
\examples{
# C-index
#U1 = simuCCP(300, metric = "Cind", value = 0.7, family = c(1,3))$data
#( cor(U1, method = "kendall") + 1 ) / 2

# C-index with a dependent copula
#U1 = simuCCP(300, metric = "Cind", value = 0.7, family = c(1,3), fam2 = 3, par2 = 1)$data
#( cor(U1, method = "kendall") + 1 ) / 2

# AUC
#U1 = simuCCP(300, metric = "AUC", value = 0.7, family = c(1,3))$data
#library(pROC)
#apply(U1[,-1], 2, function(x) auc(U1[,1], x) )

# AUC with a dependent copula
#U1 = simuCCP(300, metric = "AUC", value = 0.7, family = c(1,3), fam2 = 3, par2 = 1)$data
#library(pROC)
#apply(U1[,-1], 2, function(x) auc(U1[,1], x) )
}
