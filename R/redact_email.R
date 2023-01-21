#' Redacts an email addresses from a given string
#'
#' @param string A character vector with, at most, one element. The input string to redact email addresses from
#' @param hash_spotted When TRUE, the redaction of the email addresses will be a hash of the redacted (Default False)
#' @param replace_with A character vector with, at most, one element. When hash_spotted is FALSE, this character vector will be the replacement redacted email addresses.
#'
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "my email address is foo@gaga.com"
#' redact_email(x)
redact_email <- function(string, hash_spotted=FALSE, replace_with="EMAILADDRS") {
  # to be implemented in the next milestone
  print(string)
  print(hash_spotted)
  print(replace_with)
}
