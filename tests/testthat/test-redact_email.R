str1 <- "My email address is caesar@gmail.com and aaaa@yahoo.mail.com Thank you."

# test case 1: replace email with hash (catching 2 emails)
test_that("Hashing email works", {
  expect_equal("My email address is 4b06d8d4bc9491edb00684048e40c4d8 and 967f3839a35c04041ea6e75b7a917b04 Thank you.",
                redact_email(str1, hash_spotted=TRUE))
})

# test case 2: replace email with fixed string
test_that("Hashing email works", {
  expect_equal("My email address is EMAILADDRS and EMAILADDRS Thank you.",
               redact_email(str1, hash_spotted=FALSE))
})


str2 <- "My email address is 123456abcd@yahoo.com and zzzzz123@yahoo.mail Thank you."

# test case 3: check whether the email spotter can work on different types of email (replace with hash)
test_that("Hashing email works", {
  expect_equal("My email address is 00345d02eb20733e49077c9618f0d598 and ba68a57288bf24140628f37aadbb7920 Thank you.",
               redact_email(str2, hash_spotted=TRUE))
})

# test case 4: check whether the email spotter can work on different types of email (replace with fixed string)
test_that("Hashing email works", {
  expect_equal("My email address is EMAILADDRS and EMAILADDRS Thank you.",
               redact_email(str2, hash_spotted=FALSE))
})

str3 <- "Email address: 123456abcd at hotmail.com, another email address is zzzzz123 at onedrive.com"
# test case 5: check whether the email spotter can detect 'aaa at gmail.com' format (replace with hash)
test_that("Hashing email works", {
  expect_equal("Email address: c6598176e9f6a7c8c1208494c1a189e2, another email address is be4deee3dfc06dea00b95bf6be0a26f1",
               redact_email(str3, hash_spotted=TRUE))
})

# test case 6: check whether the email spotter can detect 'aaa at gmail.com' format (replace with fixed string)
test_that("Hashing email works", {
  expect_equal("Email address: EMAILADDRS, another email address is EMAILADDRS",
               redact_email(str3, hash_spotted=FALSE))
})
