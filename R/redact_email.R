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
#'
redact_email <- function(string, hash_spotted=FALSE, replace_with="EMAILADDRS") {
  print(string)
  print(hash_spotted)
  print(replace_with)

  regex <- "\\b[a-z0-9!#$%&'*+/=?^_`{|}~-](?:[\\.a-z0-9!#$%&'*+/=?^_`{|}~-]{0,62}[a-z0-9!#$%&'*+/=?^_`{|}~-])?(?:@|\\sat\\s)[a-z0-9](?:[a-z0-9-]+(\\.|\\sdot\\s)(?:\\.|\\sdot\\s|[a-z0-9-]){0,251}[a-z0-9])+\\b"
  if (hash_spotted) {
    new_text <- stringr::str_replace_all(string, regex, function(x) openssl::md5(x[1]))
    return(new_text)
  } else {
    new_text <- gsub(regex, replace_with, string, ignore.case = TRUE)
    return(new_text)
  }
}

