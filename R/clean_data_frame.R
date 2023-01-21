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
#' spotters <- append(spotters,spotter_1)
#' df_cleaned <- clean_data_frame(df, spotters)
clean_data_frame <- function(df, spotters_list) {
  # to be implemented in the next milestone
  print(df)
  print(spotters_list)
}
