test_that("print.Dict - basic printing", {
  # Create a simple Dict object
  my_dict <- Dict(
    age = list(
      label = "Age",
      dtype = "integer"
    ),
    gender = list(
      label = "Gender",
      dtype = "character"
    ),
    metadata = list(name = "Test Dictionary")
  )

  # Capture the output of print.Dict
  output <- capture.output(print(my_dict))

  # Check the expected output
  expect_equal(output[1], "Dictionary for 'Test Dictionary', with 2 variables.")
  expect_equal(output[2], "  name: Test Dictionary")
  # You can add more expectations for other metadata elements if needed
})

test_that("print.Dict - dictionary with no variables", {
  # Create a Dict object with no variables
  empty_dict <- Dict(metadata = list(name = "Empty Dictionary"))

  # Capture the output of print.Dict
  output <- capture.output(print(empty_dict))

  # Check the expected output
  expect_equal(output[1], "Dictionary for 'Empty Dictionary', with 0 variables.")
  expect_equal(output[2], "  name: Empty Dictionary")
})

test_that("print.Dict - dictionary with missing dtype", {
  # Create a Dict object with a variable missing dtype
  dict_missing_dtype <- Dict(
    age = list(label = "Age"),
    metadata = list(name = "Dictionary with Missing Dtype")
  )

  # Capture the output of print.Dict
  output <- capture.output(print(dict_missing_dtype))

  # Check the expected output (should not error)
  expect_equal(output[1], "Dictionary for 'Dictionary with Missing Dtype', with 1 variables.")
  expect_equal(output[2], "  name: Dictionary with Missing Dtype")
})

# You can add more tests for dictionaries with different metadata,
# variables with labels, variables without dtype, etc.
