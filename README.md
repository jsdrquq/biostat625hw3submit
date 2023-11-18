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
### Example usage
Suppose we want to perform a linear regression on the `mpg` variable in the `mtcars` dataset, considering the independent variables `wt` (weight) and `hp` (horsepower). The following code demonstrates how to achieve this using the `csqnewlm` package:

```r
# Load the csqnewlm package
library(csqnewlm)

# Example Usage
data(mtcars)
result <- newlm(mpg ~ wt + hp, data=mtcars)
result
```
### The expected output：

![image](https://github.com/jsdrquq/biostat625hw3submit/assets/143606366/8738d048-4b38-4580-8c77-42aaeb778113)
![image](https://github.com/jsdrquq/biostat625hw3submit/assets/143606366/fcba2e09-7ab6-4def-8e80-9489fff91a2c)

The output from the `newlm` function provides various components of the multiple linear regression analysis. Here's a brief description of each:

- **Formula**: The formula used for the regression: `mpg ~ wt + hp`.

- **Coefficients**: The estimated coefficients for the intercept, weight (`wt`), and horsepower (`hp`).

- **Fitted Residuals**: Fitted values and residuals for each observation in the dataset.

- **Statistics**: Key statistics of the regression analysis, including the residual sum of squares, degrees of freedom, mean squared error, F-statistic, p-value for the F-statistic, R-squared, and adjusted R-squared.

- **Standard Errors**: Standard errors, t-values, and p-values for each coefficient.

- **Confidence Intervals**: Confidence intervals for each coefficient.

- **Covariance Matrix**: Covariance matrix of the estimated coefficients.

These results provide a comprehensive summary of the linear regression analysis, enabling users to interpret the relationships between variables, assess model fit, and understand the significance of individual coefficients. Users can leverage this information to make informed decisions and draw meaningful insights from the analyzed data.

