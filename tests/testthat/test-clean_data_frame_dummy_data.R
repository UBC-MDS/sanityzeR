df_with_pii <- data.frame(read.csv(file = 'data_with_pii.csv'))
df_without_pii <- read.csv(file = 'data_without_pii.csv')
df_with_pii_cleaned_hash <- read.csv(file = 'data_with_pii_cleaned_hash.csv')
df_with_pii_cleaned_non_hash <- read.csv(file = 'data_with_pii_cleaned_non_hash.csv')


# Create Spotters (similar to test-clean_data_frame.R)

spotter_1_r <- list(redact_email,FALSE,"EMAILADDRS")
spotter_2_r <- list(redact_creditcardnumber,FALSE,"CREDITCARD")
spotters_redacted <- list(spotter_2_r,spotter_1_r)

spotter_1_h <- list(redact_email,TRUE,0)
spotter_2_h <- list(redact_creditcardnumber,TRUE,0)
spotters_hashed <- list(spotter_2_h,spotter_1_h)


# test suite 1: check if column names is correct)
test_that("Column name checking", {
  expect_true("first_name" %in% names(df_with_pii))
  expect_true("last_name" %in% names(df_with_pii))
  expect_true("email_address" %in% names(df_with_pii))
  expect_true("visa_cc" %in% names(df_with_pii))
  expect_true("master_cc" %in% names(df_with_pii))

  expect_true("first_name" %in% names(df_without_pii))
  expect_true("last_name" %in% names(df_without_pii))

  expect_true("first_name" %in% names(df_with_pii_cleaned_hash))
  expect_true("last_name" %in% names(df_with_pii_cleaned_hash))
  expect_true("email_address" %in% names(df_with_pii_cleaned_hash))
  expect_true("visa_cc" %in% names(df_with_pii_cleaned_hash))
  expect_true("master_cc" %in% names(df_with_pii_cleaned_hash))

  expect_true("first_name" %in% names(df_with_pii_cleaned_non_hash))
  expect_true("last_name" %in% names(df_with_pii_cleaned_non_hash))
  expect_true("email_address" %in% names(df_with_pii_cleaned_non_hash))
  expect_true("visa_cc" %in% names(df_with_pii_cleaned_non_hash))
  expect_true("master_cc" %in% names(df_with_pii_cleaned_non_hash))
})

# test suite 2: clean both
test_that("clean_data_frame: email & credit card hashed and redacted", {
  expect_equal(clean_data_frame(df_with_pii,spotters_hashed),df_with_pii_cleaned_hash)
  expect_equal(clean_data_frame(df_with_pii,spotters_redacted),df_with_pii_cleaned_non_hash)
})

# test suite 3: clean nothing
test_that("clean_data_frame: dataframe without PII should be the same as before", {
  expect_equal(clean_data_frame(df_without_pii,spotters_hashed),df_without_pii)
  expect_equal(clean_data_frame(df_without_pii,spotters_redacted),df_without_pii)
})
