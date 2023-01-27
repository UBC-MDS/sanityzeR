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

  # regex pattern matches: Visa - Mastercard - Amex - Discover - Diners Club - JCB
  regex <- "(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{13}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\\d{3})\\d{11})"

  # removes and white space or hyphens
  string <- stringr::str_replace_all(string, "[-\\s]", "")

  if (hash_spotted) {
    new_text <- stringr::str_replace_all(string, regex, function(x) openssl::md5(x[1]))
    return(new_text)
  } else {
    new_text <- stringr::str_replace_all(string, regex, replace_with)
    return(new_text)
  }
}


