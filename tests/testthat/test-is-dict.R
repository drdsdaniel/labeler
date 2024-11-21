test_that("is.Dict - valid Dict object", {
  # Create a valid Dict object
  valid_dict <- Dict(
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

  # Check if it's recognized as a Dict
  expect_true(is.Dict(valid_dict))
})

test_that("is.Dict - invalid Dict object (not a list)", {
  # Create an invalid object (not a list)
  invalid_dict <- "not a list"

  # Check if it's correctly identified as not a Dict
  expect_false(is.Dict(invalid_dict))
})

test_that("is.Dict - invalid Dict object (missing class)", {
  # Create an invalid object (missing 'Dict' class)
  invalid_dict <- list(metadata = list(name = "Test"))

  # Check if it's correctly identified as not a Dict
  expect_false(is.Dict(invalid_dict))
})

test_that("is.Dict - invalid Dict object (invalid metadata)", {
  # Create an invalid object (invalid metadata - not a list)
  invalid_dict <- structure(list(metadata = "invalid"), class = "Dict")
  expect_false(is.Dict(invalid_dict))

  # Create an invalid object (invalid metadata - empty list)
  invalid_dict <- structure(list(metadata = list()), class = "Dict")
  expect_false(is.Dict(invalid_dict))

  # Create an invalid object (invalid metadata - missing name)
  invalid_dict <- structure(list(metadata = list(version = 1)), class = "Dict")
  expect_false(is.Dict(invalid_dict))

  # Create an invalid object (invalid metadata - name not character)
  invalid_dict <- structure(list(metadata = list(name = 123)), class = "Dict")
  expect_false(is.Dict(invalid_dict))
})

test_that("is.Dict - invalid Dict object (invalid variable)", {
  # Create an invalid object (invalid variable - not a list)
  invalid_dict <- list(
    age = "invalid",
    metadata = list(name = "Test")
  )
  class(invalid_dict) <- "Dict"
  expect_false(is.Dict(invalid_dict))

  # Create an invalid object (invalid variable - missing label)
  invalid_dict <- list(
    age = list(labels = c("a", "b")),
    metadata = list(name = "Test")
  )
  class(invalid_dict) <- "Dict"
  expect_false(is.Dict(invalid_dict))

  # Create an invalid object (invalid variable - label not character)
  invalid_dict <- list(
    age = list(label = 123),
    metadata = list(name = "Test")
  )
  class(invalid_dict) <- "Dict"
  expect_false(is.Dict(invalid_dict))

  # # More tests for invalid labels, dtype (optional), etc. can be added here
  # ...
})
