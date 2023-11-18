#' Fit a linear regression model using the least squares method
#'
#' @param formula To specify the response and independent variables.
#'
#' @param data The dataframe which contains the variables specified in the formula.
#'
#' @return Coefficients, fitted values and residuals,
#'         various statistics such as the t-statistic, F-statistic, R-squared,
#'         standard errors, confidence intervals, and the covariance matrix.
#'
#' @export
#'
#' @description Fits a multiple linear regression model to the specified data using the least squares method.
#'     Calculates model coefficients, fitted values, residuals, and provides various statistical measures,
#'     including the t-statistic, F-statistic, R-squared. Additionally, computes
#'     standard errors, confidence intervals, and the covariance matrix of the estimated coefficients.
#'
#' @examples
#' data(mtcars)
#' result <- newlm(mpg ~ wt + hp, mtcars)
#'
newlm <- function(formula, data) {
  # convert formula to matrix X and response y
  formula <- as.formula(formula)
  X <- model.matrix(formula, data)
  y <- model.response(model.frame(formula, data))

  # calculate beta and fitted values
  beta <- solve(t(X) %*% X) %*% t(X) %*% y
  fitted_values <- X %*% beta

  # calculate residuals and sum of squared residuals (SSE)
  residuals <- y - fitted_values
  SSE <- sum(residuals^2)

  # Calculate residual degrees of freedom
  n <- length(y)
  p <- ncol(X)
  df_SSE <- n - p

  # Calculate MSE and covariance matrix(convert to )
  MSE=SSE / df_SSE
  cov_matrix <-  MSE * solve(t(X) %*% X)

  # Calculate standard errors of coefficients
  std_errors <- sqrt(diag(cov_matrix))

  # Calculate confidence intervals
  conf_intervals <- cbind(
    beta - qt(0.975, df_SSE) * std_errors,
    beta + qt(0.975, df_SSE) * std_errors
  )

  # Calculate t-values, p-values for each coefficient
  t_values <- beta / std_errors
  p_values <- 2 * pt(abs(t_values), df_SSE, lower.tail = FALSE)

  # Calculate F-statistic and its p value
  SSR <- sum((fitted_values - mean(y))^2)
  f_statistic <- (SSR / (p - 1)) / MSE
  p_value_f <- pf(f_statistic, p - 1, df_SSE, lower.tail = FALSE)

  # Calculate R-squared and adjusted R-squared
  SSY <- sum((y - mean(y))^2)
  r_squared <- SSR / SSY
  adjusted_r_squared <- 1 - MSE / (SSY / (n - 1))

  # Create a list containing all relevant information
  result <- list(
    coefficients = beta,
    fitted_values = fitted_values,
    residuals = residuals,
    residual_sum_of_squares = SSE,
    df_SSE = df_SSE,
    MSE=MSE,
    std_errors = std_errors,
    conf_intervals = conf_intervals,
    t_values = t_values,
    p_values = p_values,
    f_statistic = f_statistic,
    p_value_f=p_value_f,
    cov_matrix = cov_matrix,
    r_squared = r_squared,
    adjusted_r_squared = adjusted_r_squared
  )
  # Create separate data frames for different parts of the result
  coefficients_df <- data.frame(Coefficients = result$coefficients)
  fitted_residual_df <- data.frame(
    Fitted_Values = result$fitted_values,
    Residuals = result$residuals
  )
  statistics_df <- data.frame(
    Residual_Sum_of_Squares = result$residual_sum_of_squares,
    Degrees_of_Freedom_SSE = result$df_SSE,
    Mean_Squared_Error = result$MSE,
    F_Statistic = result$f_statistic,
    P_Value_F = result$p_value_f,
    R_squared = result$r_squared,
    Adjusted_R_squared = result$adjusted_r_squared
  )
  standard_errors_df <- data.frame(
    Standard_Errors = result$std_errors,
    t_Values = result$t_values,
    p_Values = result$p_values
  )
  confidence_intervals_df <- data.frame(
    Confidence_Intervals_Lower = result$conf_intervals[, 1],
    Confidence_Intervals_Upper = result$conf_intervals[, 2]
  )

  # Return a list of data frames
  result_list <- list(
    formula = formula,
    Coefficients = coefficients_df,
    Fitted_Residuals = fitted_residual_df,
    Statistics = statistics_df,
    Standard_Errors = standard_errors_df,
    Confidence_Intervals = confidence_intervals_df,
    Cov_Matrix = cov_matrix
  )

  # Return the list
  return(result_list)
}
