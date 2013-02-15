\name{mice.impute.rfcat}
\alias{mice.impute.rfcat}

\title{
Impute categorical variables using Random Forest within MICE
}

\description{
This method can be used to impute categorical variables  (binary or >2 levels) in MICE by specifying
method = 'rfcat'.
}

\usage{
mice.impute.rfcat(y, ry, x, ntree_cat, nodesize_cat, ...)
}

\arguments{
  \item{y}{
a vector of observed values and missing values of the variable to be imputed.
}
  \item{ry}{
a logical vector stating whether y is observed or not.
}
  \item{x}{
a matrix of predictors to impute y.
}
  \item{ntree_cat}{
number of trees, default = 10. A global option can be set by calling setRFoptions(ntree_cat=XX).
}
  \item{nodesize_cat}{
minimum size of nodes, default = 1.
A global option can be set by calling setRFoptions(nodesize_cat=XX).
Smaller values of nodesize create finer, more precise trees but makes the program slower.
}
  \item{\dots}{
other arguments to pass to randomForest.
}
}

\details{
This Random Forest imputation algorithm has been developed as an alternative to logistic or
polytomous regression, and can accommodate non-linear relations and interactions among the
predictor variables without requiring them to be specified in the model. The algorithm takes
a bootstrap sample of the data to simulate sampling variability, fits a set of classification
trees, and chooses each imputed value as the prediction of a randomly chosen tree.
}

\value{
A vector of imputed values of y.
}

\references{
[reference to submitted Am J Epid paper]
}

\author{
Anoop Shah
}

\note{
This algorithm has been tested on simulated data and in survival analysis of real data
with artificially introduced missingness completely at random. There was slight bias in
hazard ratios compared to polytomous regression, but coverage of confidence intervals was
correct.
}


\seealso{
\code{\link{setRFoptions}}, \code{\link{mice.impute.rfcont}}
}


\examples{
set.seed(1)
mydata <- simdata(100, x2binary=TRUE)
mymardata <- makemar(mydata)

cat('\nNumber of missing values:\n')
print(sapply(mymardata, function(x){sum(is.na(x))}))

# Analyse data
cat('\nFull data analysis:\n')
print(summary(lm(y ~ x1 + x2 + x3, data=mydata)))

cat('\nMICE normal and logistic:\n')
print(summary(pool(with(mice(mymardata,
	method=c('', 'norm', 'logreg', '', '')), lm(y ~ x1 + x2 + x3)))))

# Set options for Random Forest
setRFoptions(ntree_cat=10)

cat('\nMICE using Random Forest:\n')
print(summary(pool(with(mice(mymardata,
	method=c('', 'rfcont', 'rfcat', '', '')), lm(y ~ x1 + x2 + x3)))))
}