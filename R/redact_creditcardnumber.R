#' Redacts credit card numbers from a given string
#'
#' @param string A character vector with, at most, one element. The input string to redact credit card numbers from
#' @param hash_spotted When TRUE, the redaction of the credit cards will be a hash of the redacted (Default False)
#' @param replace_with A character vector with, at most, one element. When hash_spotted is FALSE, this character vector will be the replacement redacted credit card numbers.
#'
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "You can use my 5567554868135971 here"
#' redact_creditcardnumber(x)
redact_creditcardnumber <- function(string, hash_spotted=FALSE, replace_with="CREDITCARD") {
  # to be implemented in the next milestone
  print(string)
  print(hash_spotted)
  print(replace_with)
}
