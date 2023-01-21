
# sanityzeR

<!-- badges: start -->
<!-- badges: end -->

![](logo.png)

The goal of sanityzeR:

Data scientists often need to remove or redact Personal Identifiable
Information (PII) from their data. This package provides utilities to
spot and redact PII from r data frames/Tibbles.

PII can be used to uniquely identify a person. This includes names,
addresses, credit card numbers, phone numbers, email addresses, and
social security numbers, and therefore regulatory bodies such as the
European Union’s General Data Protection Regulation (GDPR) and the
California Consumer Privacy Act (CCPA) require that PII be removed or
redacted from data sets before they are shared an further processed

## Why `sanityzeR` ?

Because it’s a fun name and it’s a play on the word “sanitize” which is
what we are doing to the data

## Similar R packages

The closest R package in functionality is
[**anonymizer**](https://www.rdocumentation.org/packages/anonymizer/versions/0.2.0)which
is a package for finding and removing PII from text. The package is not
designed to work with data frames directly and we believe that our
package will be more user-friendly and intuitive as it accepts data
frames directly. In addition, sanityzeR gives the ability for users to
define new type of spotters to redact new types of PII.

## Installation

You can install the development version of sanityzeR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/sanityzeR")
```

## Example

This is a basic example which shows you how to solve a common problem:
**edit this**

``` r
library(sanityzeR)
## basic example code
```

## Features and Usage

Conceptually, `sanityzeR` is a package that provides a way to remove PII
from Pandas data frames. The package provides a number of default
spotters, which can be used to identify PII in the data and redact them.

The library comes with two default redaction functions
`redact_creditcardnumber` and `redact_email` and which simply takes a
character vector and redacts the corresponding PII using either a
constant string replacement or a hash of the redaction.

## Functions

1.  `redact_creditcardnumber()`: a function that takes a character
    vector (string) and redacts credit card numbers contained within
    that string, replacing them with either:
    1.  A constant string that the user can specify

    2.  A hash of the redaction (using MD5)
2.  `redact_email`: a function that takes a character vector (string)
    and redacts email addresses contained within that string, replacing
    them with either:
    1.  A constant string that the user can specify

    2.  A hash of the redaction (using MD5)
3.  `clean_data_frame`: a function that takes as input the following
    list of arguments below and returns a deep copy of the cleaned
    data.frame:
    1.  An input data.frame `df` to clean

    2.  A list of spotter information arguments. Each item in the list
        is a list of 3 elements:

        1.  The redact\_\* function to use
            (e.g. `redact_creditcardnumber` ).

        2.  The second argument of the redact\_\* function:
            `hash_spotted` (TRUE or FALSE) or 0 to use the default
            argument.

        3.  The third argument of the redact\_\* function:
            `replace_with` (a redaction string) or 0 to use the default
            argument.

Below is a simple quick start example:

``` r
library(sanityzeR)
df <- data.frame()
spotters <- list()
spotter_1 <- list(redact_email,TRUE,0)
spotters <- append(spotters,spotter_1)

df_cleaned <- clean_data_frame(df, spotters)
```

## High-level Design

To better understand the design of the package, we have provided a
high-level design document, which will be kept up to date as the package
evolves. The document can be found
[here](https://github.com/UBC-MDS/sanityze/blob/main/HighLevelDesign.md).

## Contributing

Interested in contributing? Check out the [contributing
guidelines](CONTRIBUTING.md). Please note that this project is released
with a Code of Conduct. By contributing to this project, you agree to
abide by its terms.

## License

`sanityzeR` was created by Caesar Wong, Jonah Hamilton and Tony Zoght.
It is licensed under the terms of the [MIT license](LICENSE).

## Credits

`sanityzeR` was created using **devtools** and **usethis** R packages.

## Quick Links

- [Kanban Board](https://github.com/orgs/UBC-MDS/projects/15)
- [Issues](https://github.com/UBC-MDS/sanityzeR/issues)
- [High Level
  Design](https://github.com/UBC-MDS/sanityze/blob/main/HighLevelDesign.md)
- [Contributing Guidelines](CONTRIBUTING.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [License](LICENSE.md)
