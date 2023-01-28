################ Test Data #####################################################
df <- data.frame(
 Name = c("My email address is 123456abcd@yahoo.com and zzzzz123@yahoo.mail Thank you.",
                          "Bill for: 4556129404313766",
                          "Maria",
                          "Ben",
                          "Tina"),
                 Age = c(23, 41, 32, 16, 26)
)

df_hashed <- data.frame(
  Name = c("My email address is 00345d02eb20733e49077c9618f0d598 and ba68a57288bf24140628f37aadbb7920 Thank you.",
                                 "Bill for: e93723ee0d38e30a68902aef6b0033de",
                                 "Maria",
                                 "Ben",
                                 "Tina"),
                        Age = c(23, 41, 32, 16, 26)
)

df_redacted <- data.frame(
  Name = c("My email address is EMAILADDRS and EMAILADDRS Thank you.",
                                   "Bill for: CREDITCARD",
                                   "Maria",
                                   "Ben",
                                   "Tina"),
                          Age = c(23, 41, 32, 16, 26)
)


df_email <- data.frame(Name = c("My email address is 123456abcd@yahoo.com and zzzzz123@yahoo.mail Thank you."),
                        Age = c(23)
)
df_email_hashed <- data.frame(Name = c("My email address is 00345d02eb20733e49077c9618f0d598 and ba68a57288bf24140628f37aadbb7920 Thank you."),
                              Age = c(23)
)
df_email_redacted <- data.frame(Name = c("My email address is EMAILADDRS and EMAILADDRS Thank you."),
                              Age = c(23)
)

df_cc <- data.frame(Name = c("Bill for: 4556129404313766"),
                       Age = c(23)
)
df_cc_hashed <- data.frame(Name = c("Bill for: e93723ee0d38e30a68902aef6b0033de"),
                              Age = c(23)
)
df_cc_redacted <- data.frame(Name = c("Bill for: CREDITCARD"),
                                Age = c(23)
)


# spotters empty
spotters_empty <- list()

spotter_1_r <- list(redact_email,FALSE,"EMAILADDRS")
spotter_2_r <- list(redact_creditcardnumber,FALSE,"CREDITCARD")
spotters_redacted <- list(spotter_2_r,spotter_1_r)

spotter_1_h <- list(redact_email,TRUE,0)
spotter_2_h <- list(redact_creditcardnumber,TRUE,0)
spotters_hashed <- list(spotter_2_h,spotter_1_h)

spotter_1_h <- list(redact_email,FALSE,"EMAILADDRS")
spotters_e_redacted <- list(spotter_1_h)

spotter_1_r <- list(redact_email,TRUE,0)
spotters_e_hashed <- list(spotter_1_r)

spotter_1_hc <- list(redact_creditcardnumber,FALSE,"CREDITCARD")
spotters_cc_redacted <- list(spotter_1_hc)

spotter_1_rc <- list(redact_creditcardnumber,TRUE,0)
spotters_cc_hashed <- list(spotter_1_rc)

################ Test Suites ###################################################
# test suite 1: error checking and validation
test_that("clean_data_frame: error checking and validation", {
  expect_error(clean_data_frame(NULL,NULL),"df to clean cannot be NULL")

  expect_error(clean_data_frame(df,NULL),"spotters_list cannot be NULL")

  expect_error(clean_data_frame(NULL,spotters),"df to clean cannot be NULL")

  expect_error(clean_data_frame(df,"not a list"),"spotters_list must be a list")

  expect_error(clean_data_frame("df",spotters),"df to clean must be a data.frame")

  expect_error(clean_data_frame(df,spotters_empty),"spotters_list cannot be empty")
})

# test suite 2: hashed and redacted email only
test_that("clean_data_frame: email hashed and redacted", {

  expect_equal(clean_data_frame(df_email,spotters_e_hashed),df_email_hashed)

  expect_equal(clean_data_frame(df_email,spotters_e_redacted),df_email_redacted)
})

# test suite 3: hashed and redacted credit card  only
test_that("clean_data_frame: credit card hashed and redacted", {

  expect_equal(clean_data_frame(df_cc,spotters_cc_hashed),df_cc_hashed)

  expect_equal(clean_data_frame(df_cc,spotters_cc_redacted),df_cc_redacted)
})

# test suite 4: end to end
test_that("clean_data_frame: credit card and email", {

  expect_equal(clean_data_frame(df,spotters_hashed),df_hashed)

  expect_equal(clean_data_frame(df,spotters_redacted),df_redacted)
})
