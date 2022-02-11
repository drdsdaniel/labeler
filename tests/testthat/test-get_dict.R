test_that("get_dict", {
  local_edition(3)
  dict <- list(
    MARRIED = list(
      lab = "Married",
      labs = c("Yes" = 1, "No" = 2)
    )
  )
  tbl <- data.frame(
    MARRIED = c(1, 2, 2, 2, 1, 2, 1, 2, 1, 1, 1)
  )
  expect_snapshot(get_dict(set_labels(tbl, dict)))
})
