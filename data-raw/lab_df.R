## code to prepare `DATASET` dataset goes here

lbl_df <- data.frame(
  sex = sample(1:2, 100, replace = TRUE),
  age = sample(1:100, 100, replace = TRUE)
)

usethis::use_data(lbl_df, overwrite = TRUE, ascii = TRUE)

# lbl_df_dict <- list(
#   metadata = list(name = "lbl_df"),
#   sex = list(
#     label = "Sex || What is your sex?",
#     labels = c("Male", "Female"),
#     dtype = "character"
#   )
# )
# print.Dict(do.call(Dict, lbl_df_dict))


lbl_df_dict <- Dict(
  metadata = list(name = "lbl_df"),
  sex = list(
    label = "Sex || What is your sex?",
    labels = c("Male" = 1, "Female" = 2),
    dtype = "integer"
  )
)
print.Dict(lbl_df_dict)
usethis::use_data(lbl_df_dict, overwrite = TRUE, ascii = TRUE)