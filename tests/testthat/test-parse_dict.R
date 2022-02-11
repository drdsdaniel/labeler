test_that("parse_dict", {
  local_edition(3)
  dict <- list(
    MARRIED = list(
      lab = "Married",
      labs = c("Sí" = 1, "No" = 2)
    )
  )
  expect_snapshot(parse_dict(dict))
})
