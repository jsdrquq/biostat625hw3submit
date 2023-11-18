# csqnewlm
<!-- badges: start -->
  [![R-CMD-check](https://github.com/jsdrquq/biostat625hw3submit/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jsdrquq/biostat625hw3submit/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->
  <!-- badges: start -->
  [![Codecov test coverage](https://codecov.io/gh/jsdrquq/biostat625hw3submit/branch/master/graph/badge.svg)](https://app.codecov.io/gh/jsdrquq/biostat625hw3submit?branch=master)
  <!-- badges: end -->
  
This R package fits a multiple linear regression model to specified data using the least squares method. It requires a formula specifying the response and independent variables, as well as a dataframe (data) containing the specified variables and returns a list containing key statistics such as coefficients, fitted values, residuals, t-statistic, F-statistic, R-squared, standard errors, confidence intervals, and the covariance matrix.

## Installation
You can install the development version of `csqnewlm` from GitHub using the `devtools` package with the following code:

```r
# install.packages("devtools")
devtools::install_github("jsdrquq/biostat625hw3submit")
```
## Example
Suppose we want to perform a linear regression on the `mpg` variable in the `mtcars` dataset, considering the independent variables `wt` (weight) and `hp` (horsepower). The following code demonstrates how to achieve this using the `csqnewlm` package:

```r
# Load the csqnewlm package
library(csqnewlm)

# Example Usage
data(mtcars)
result <- newlm(mpg ~ wt + hp, data=mtcars)
result
```


