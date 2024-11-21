test_that("gen_Dict - basic functionality", {
  # Simulate a simple dataset
  my_data <- data.frame(
    id = 1:10,
    gender = sample(1:2, 10, replace = TRUE),
    age = sample(20:60, 10, replace = TRUE),
    education = sample(1:3, 10, replace = TRUE),
    income = runif(10, 30000, 80000)
  )

  # Create the corresponding dictionary
  my_dict <- Dict(
    metadata = list(name = "My Sample Dataset", description = "A simulated dataset for demonstration"),
    id = list(
      label = "ID || Participant Identifier",
      dtype = "integer"
    ),
    gender = list(
      label = "Gender || What is your gender?",
      labels = c("Male" = 1, "Female" = 2),
      dtype = "integer"
    ),
    age = list(
      label = "Age || What is your age?",
      dtype = "integer"
    ),
    education = list(
      label = "Education || What is your highest level of education?",
      labels = c("High School" = 1, "Bachelor's" = 2, "Master's" = 3),
      dtype = "integer"
    ),
    income = list(
      label = "Income || What is your annual income?",
      dtype = "numeric"
    )
  )

  # You can now use these objects for testing or demonstration purposes
  # For example:
  # print(my_dict)
  # browse_dict(my_dict)
  # labeled_data <- set_Dict(my_data, my_dict)

  # Use the simulated dataset and dictionary
  df <- my_data
  expected_dict <- my_dict

  # Generate a Dict object from the data frame
  generated_dict <- gen_Dict(set_Dict(df, expected_dict))

  # Check if it's a valid Dict
  expect_true(is.Dict(generated_dict))

  # Check metadata
  expect_equal(generated_dict$metadata$name, expected_dict$metadata$name)

  # Check variable definitions (you can add more variables as needed)
  expect_equal(generated_dict$id$label, expected_dict$id$label)
  expect_equal(generated_dict$id$labels, expected_dict$id$labels) # Should be NULL
  expect_equal(generated_dict$id$dtype, expected_dict$id$dtype)

  expect_equal(generated_dict$gender$label, expected_dict$gender$label)
  expect_equal(generated_dict$gender$labels, expected_dict$gender$labels)
  expect_equal(generated_dict$gender$dtype, expected_dict$gender$dtype)

  # ... Add similar checks for other variables (age, education, income) ...
})






test_that("gen_Dict - with custom metadata", {
  # Simulate a simple dataset
  my_data <- data.frame(
    id = 1:10,
    gender = factor(sample(c("Male", "Female"), 10, replace = TRUE),
                    levels = c("Male", "Female"),
                    labels = c("Male", "Female")),
    age = sample(20:60, 10, replace = TRUE),
    education = factor(sample(c("High School", "Bachelor's", "Master's"), 10, replace = TRUE),
                       levels = c("High School", "Bachelor's", "Master's"),
                       labels = c("High School", "Bachelor's", "Master's")),
    income = runif(10, 30000, 80000)
  )

  # Create the corresponding dictionary
  my_dict <- Dict(
    metadata = list(name = "My Sample Dataset", description = "A simulated dataset for demonstration"),
    id = list(
      label = "ID || Participant Identifier",
      dtype = "integer"
    ),
    gender = list(
      label = "Gender || What is your gender?",
      labels = c("Male" = "Male", "Female" = "Female"),
      dtype = "factor"
    ),
    age = list(
      label = "Age || What is your age?",
      dtype = "integer"
    ),
    education = list(
      label = "Education || What is your highest level of education?",
      labels = c("High School" = "High School", "Bachelor's" = "Bachelor's", "Master's" = "Master's"),
      dtype = "factor"
    ),
    income = list(
      label = "Income || What is your annual income?",
      dtype = "numeric"
    )
  )

  # You can now use these objects for testing or demonstration purposes
  # For example:
  # print(my_dict)
  # browse_dict(my_dict)
  # labeled_data <- set_Dict(my_data, my_dict)
  # Use the simulated dataset
  df <- my_data

  # Generate a Dict object with custom metadata
  metadata <- list(name = "My Custom Dictionary", source = "Survey Data")
  generated_dict <- gen_Dict(df, metadata = metadata)

  # Check custom metadata
  expect_equal(generated_dict$metadata$name, "My Custom Dictionary")
  expect_equal(generated_dict$metadata$source, "Survey Data")
})

# You can add more tests for edge cases or specific scenarios
# as needed, using the simulated dataset and dictionary.
