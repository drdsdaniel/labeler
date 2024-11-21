#' Work with a Dataset Using a Dictionary
#' `r lifecycle::badge("experimental")`
#'
#' A convenience function to apply a dictionary to a dataset and optionally convert variables to factors
#' with labels as levels or replace column names with variable labels.
#'
#' @param tbl A data.frame or tibble.
#' @param dict A Dict object (optional). If NULL, it assumes the dataset already has a dictionary applied.
#' @param subset (Optional) A character vector specifying variables to work with.
#' @param use_label Logical, indicating whether to replace column names with variable label (default is TRUE).
#' @param use_labels Logical, indicating whether to convert variables to factors with labels as levels (default is TRUE).
#' @param ... Additional arguments passed to \code{set_Dict}.
#'
#' @return The modified dataset.
#' @export
#'
#' @examples
#' \dontrun{
#'   factored_data <- with_Dict(lbl_df, lbl_df_dict, use_labels = TRUE)
#'   renamed_data <- with_Dict(lbl_df, lbl_df_dict, use_label = TRUE)
#' }
with_Dict <- function(tbl, dict = NULL, subset = NULL, use_label = TRUE, use_labels = TRUE, ...) {
  if (!is.null(dict)) {
    tbl <- set_Dict(tbl, dict, subset = subset, ...)
  }
  if (use_labels) {
    if (is.null(subset)) {
      tbl <- sjlabelled::as_label(tbl)
    } else {
      tbl <- tbl |> dplyr::mutate(dplyr::across(dplyr::all_of(subset), sjlabelled::as_label))
    }
  }

  if (use_label) {
    if (is.null(subset)) {
      tbl <- sjlabelled::label_to_colnames(tbl)
    } else {
      .subset <- append(list(tbl), as.list(rlang::syms(subset)))
      tbl <- do.call(sjlabelled::label_to_colnames, .subset)
    }
  }

  return(tbl)
}

#   lbl_df |> set_Dict(lbl_df_dict, label_type = "name") |> dplyr::count(sex) |> with_Dict(subset = "sex")
