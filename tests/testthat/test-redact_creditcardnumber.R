# fake CC for testing
fake_cc <- c("VISA, 4556129404313766",
             "MASTERCARD, 5567554868135971",
             "AMEX, 345160678082328",
             "DINERS, 3013130458900846",
             "DISCOVER, 6011087735246416",
             "JCB, 3538159804477445"
)

# cc replace hash
fake_cc_hashes <- c('VISA, e93723ee0d38e30a68902aef6b0033de',
                    'MASTERCARD, 26f6a9e75c5e837215449790c3edb9f5',
                    'AMEX, 302e590b9f7052140eedde5f8b9e6d91',
                    'DINERS, 177b6b9ce5f4e37dbfefd957841485e6',
                    'DISCOVER, 60a88fe71767c452194c2168033506c1',
                    'JCB, b5906f02d7fd3684279f4fabc0ac9ec1')

# cc replace fixed string
fake_cc_fixed <- c("VISA, CREDITCARD", "MASTERCARD, CREDITCARD", "AMEX, CREDITCARD",
                    "DINERS, CREDITCARD", "DISCOVER, CREDITCARD","JCB, CREDITCARD" )


# cc
test_cc <- c("VISA, 4916363769587210, 10/2023, 992",
             "VISA, 4916363769587210, 10/2023, 992")

# cc cleaned - fixed string
test_cc_clean <- c("VISA, CREDITCARD, 10/2023, 992",
                   "VISA, CREDITCARD, 10/2023, 992")

# cc cleaned - hashed
test_cc_clean_hash <- c("VISA, d45a171d816f68107a1af7c3ee4950f6, 10/2023, 992",
                        "VISA, d45a171d816f68107a1af7c3ee4950f6, 10/2023, 992")

# strings of equal and random length to credit cards
number_string <- c("5628404238239405, 5673289472024660, 8709, 356785, 1111111111111111, 329481234558901")

number_string_clean <- c('5628404238239405, 5673289472024660, 8709, 356785, 1111111111111111, 329481234558901')


# test case 1: replace credit card number with fixed string
test_that("replacing fixed string works", {
  expect_equal(fake_cc_fixed,
               redact_creditcardnumber(fake_cc, hash_spotted = FALSE))
})

# test case 2: replace credit card number with hash
test_that("replacing CC number with md5 hash works", {
  expect_equal(fake_cc_hashes,
               redact_creditcardnumber(fake_cc, hash_spotted = TRUE))
})

# test case 4: replace credit card number with spaces and hyphens
test_that("replacing CC number with whitespace and hyphens works", {
  expect_equal(test_cc_clean,
               redact_creditcardnumber(test_cc, hash_spotted = FALSE))
})

# test case 5: replace credit card number with spaces and hyphens
test_that("replacing CC number with whitespace and hyphens works for md5 hash", {
  expect_equal(test_cc_clean_hash,
               redact_creditcardnumber(test_cc, hash_spotted = TRUE))
})

# test case 6: random numbers do not get replaced
test_that("random numbers do not get replaced", {
  expect_equal(number_string_clean,
               redact_creditcardnumber(number_string, hash_spotted = TRUE))
})


