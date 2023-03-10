% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/redact_creditcardnumber.R
\name{redact_creditcardnumber}
\alias{redact_creditcardnumber}
\title{Redacts credit card numbers from a given string}
\usage{
redact_creditcardnumber(
  string,
  hash_spotted = FALSE,
  replace_with = "CREDITCARD"
)
}
\arguments{
\item{string}{A character vector with, at most, one element. The input string to redact credit card numbers from}

\item{hash_spotted}{When TRUE, the redaction of the credit cards will be a hash of the redacted (Default False)}

\item{replace_with}{A character vector with, at most, one element. When hash_spotted is FALSE, this character vector will be the replacement redacted credit card numbers.}
}
\value{
A character vector.
}
\description{
Redacts credit card numbers from a given string
}
\examples{
x <- "You can use my 5567554868135971 here"
redact_creditcardnumber(x)
}
