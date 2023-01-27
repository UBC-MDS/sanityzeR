#' Cleans a data.frame by redacting PII information from character vector columns
#'
#' @param df A data.frame to clean
#' @param spotters_list A list containing lists of 3 elements each:
#' 1. the redact function
#' 2. hash_spotted value to pass or 0 to keep the default
#' 3. the replace_with value or 0 to keep the default
#'
#'
#' @return A deep copy of the cleaned data.frame.
#' @export
#'
#' @examples
#' df <- data.frame()
#' spotters <- list()
#' spotter_1 <- list(redact_email,TRUE,0)
#' spotters <- list(spotter_1)
#' df_cleaned <- clean_data_frame(df, spotters)
clean_data_frame <- function(df, spotters_list) {
  if (is.null(df)) {
    stop("df to clean cannot be NULL")
  }
  if (!is.data.frame(df)) {
    stop("df to clean must be a data.frame")
  }
  if (is.null(spotters_list)) {
    stop("spotters_list cannot be NULL")
  }
  if (!is.list(spotters_list)) {
    stop("spotters_list must be a list")
  }
  if (length(spotters_list) == 0) {
    stop("spotters_list cannot be empty")
  }
  df_copy <- df
  for(i in 1:nrow(df_copy)) {
    for (j in 1:ncol(df_copy)) {
      o <- df_copy[i,j]
      if (is.character(o)) {
        df_copy[i,j] <- redact_it(o,spotters_list)
      }
    }
  }
  df_copy
}

#' Cleans a data.frame by redacting PII information from character vector columns
#'
#' @param string A string to redact
#' @param spotters_list A list containing lists of 3 elements each:
#' 1. the redact function
#' 2. hash_spotted value to pass or 0 to keep the default
#' 3. the replace_with value or 0 to keep the default
#'
#'
#' @return A redacted string
redact_it <- function(string, spotters_list) {
  newstring <- string
  for (spotter in spotters_list) {
    func <- spotter[[1]]
    if (spotter[[2]] == 0  & spotter[[3]] == 0) {
      newstring <- func(newstring)
    } else if (spotter[[2]] != 0 & spotter[[3]] == 0) {
      newstring <- func(newstring, hash_spotted=spotter[[2]])
    } else if (spotter[[2]] == 0 & spotter[[3]] != 0) {
      newstring <- func(newstring, replace_with=spotter[[3]])
    } else {
      newstring <- func(newstring,hash_spotted=spotter[[2]],replace_with=spotter[[3]])
    }
  }
  newstring
}



