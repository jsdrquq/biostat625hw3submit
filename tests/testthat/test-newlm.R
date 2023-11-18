test_that("newlm works", {
  data(mtcars)
  newlm_model <- newlm(mpg ~ hp, data = mtcars)
  lm_model <- lm(mpg ~ hp, data = mtcars)

  # Test coefficients
  expect_equal(coef(lm_model), newlm_model$Coefficients$Coefficients, ignore_attr = TRUE)

  # Test fitted values
  expect_equal(fitted(lm_model), newlm_model$Fitted_Residuals$Fitted_Values, ignore_attr = TRUE)

  # Test residuals
  expect_equal(residuals(lm_model), newlm_model$Fitted_Residuals$Residuals, ignore_attr = TRUE)

  # Test residual sum of squares
  expect_equal(sum(residuals(lm_model)^2), newlm_model$Statistics$Residual_Sum_of_Squares, ignore_attr = TRUE)

  # Test degrees of freedom for SSE
  expect_equal(summary(lm_model)$df[2], newlm_model$Statistics$Degrees_of_Freedom_SSE, ignore_attr = TRUE)

  # Test mean squared error
  expect_equal(summary(lm_model)$sigma^2, newlm_model$Statistics$Mean_Squared_Error, ignore_attr = TRUE)

  # Test standard errors
  expect_equal(summary(lm_model)$coefficients[, "Std. Error"], newlm_model$Standard_Errors$Standard_Errors, ignore_attr = TRUE)

  # Test confidence intervals
  expect_equal(as.data.frame(confint(lm_model)), newlm_model$Confidence_Intervals, ignore_attr = TRUE)

  # Test t-values
  expect_equal(summary(lm_model)$coefficients[, "t value"], newlm_model$Standard_Errors$t_Values, ignore_attr = TRUE)

  # Test p-values
  expect_equal(summary(lm_model)$coefficients[, "Pr(>|t|)"], newlm_model$Standard_Errors$p_Values, ignore_attr = TRUE)

  # Test F-statistic
  expect_equal(summary(lm_model)$fstatistic[1], newlm_model$Statistics$F_Statistic, ignore_attr = TRUE)

  # Test p-value of F-statistic
  expect_equal(pf(summary(lm_model)$fstatistic[1], summary(lm_model)$fstatistic[2], summary(lm_model)$fstatistic[3], lower.tail = FALSE), newlm_model$Statistics$P_Value_F, ignore_attr = TRUE)

  # Test R-squared
  expect_equal(summary(lm_model)$r.squared, newlm_model$Statistics$R_squared, ignore_attr = TRUE)

  # Test adjusted R-squared
  expect_equal(summary(lm_model)$adj.r.squared, newlm_model$Statistics$Adjusted_R_squared, ignore_attr = TRUE)

  # Test covariance matrix
  expect_equal(vcov(lm_model), newlm_model$Cov_Matrix, ignore_attr = TRUE)

})
