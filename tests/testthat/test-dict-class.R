test_that("Dict creation - valid input", {
  # Valid dictionary with metadata and variables
  my_dict <- Dict(
    age = list(
      label = "Age || Age of respondent",
      labels = c("Under 18" = 1, "18-24" = 2),
      dtype = "integer"
    ),
    gender = list(
      label = "Gender",
      labels = c("Male" = 1, "Female" = 2),
      dtype = "character"
    ),
    metadata = list(name = "My Survey Dictionary")
  )

  expect_true(is.Dict(my_dict))
  expect_equal(my_dict$metadata$name, "My Survey Dictionary")
  expect_equal(my_dict$age$label, "Age || Age of respondent")
  expect_equal(my_dict$gender$dtype, "character")
})

test_that("Dict creation - invalid input", {
  # Invalid metadata (not a list)
  expect_error(Dict(age = list(label = "Age"), metadata = "invalid"),
               "Invalid metadata. Must be a list")

  # Invalid metadata (empty list)
  expect_error(Dict(age = list(label = "Age"), metadata = list()),
               "Invalid metadata. Must be a list with at least one element")

  # Invalid metadata (missing name)
  expect_error(Dict(age = list(label = "Age"), metadata = list(version = "1.0")),
               "Invalid metadata. Must have a valid name element")

  # Invalid variable (not a list)
  expect_error(Dict(age = "invalid", metadata = list(name = "Test")),
               "Invalid argument: age. Must be a list")

  # Invalid variable (missing label)
  expect_error(Dict(age = list(labels = c(1, 2)), metadata = list(name = "Test")),
               "Invalid argument: age. Must have a label element")

  # Invalid variable label (not a character)
  expect_error(Dict(age = list(label = 123), metadata = list(name = "Test")),
               "Invalid argument: age. Must have a label element")

  # # More tests for invalid labels, dtype (optional), etc. can be added here
  # ...
})
