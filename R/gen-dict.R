#' Generate a Dictionary from a labelled dataset
#' `r lifecycle::badge("experimental")`
#'
#' Creates a Dict object from a labeled dataset (data.frame or tibble).
#'
#' @param tbl A labeled dataset.
#' @param metadata A list containing metadata for the dictionary.
#'   It must contain at least a "name" element.
#'   If NULL, the name of the dataset will be used.
#'
#' @return A Dict object representing the dictionary of the dataset.
#' @export
#'
#' @examples
#' \dontrun{
#'     my_dict <- gen_Dict(lbl_df)
#' }
gen_Dict <- function(tbl, metadata = attributes(tbl)$dict_metadata) {
   #browser()
  rlang::check_installed("labelled")
  dict0 <- labelled::generate_dictionary(tbl)
  dict <- list()
  for (.row in 1:nrow(dict0)) {
    variable <- dict0[["variable"]][[.row]]
    label <- dict0[["label"]][[.row]]
    labels <- dict0[["value_labels"]][[.row]]
    dtype <- class(tbl[[variable]])
    # name <- NULL

    # if (!is.null(labels)) {
    dict[[variable]] <- list(
      label = ifelse(is.na(label), variable, label),
      # name = name,
      labels = labels,
      dtype = dtype
    )
    # }
  }
  # dict$metadata <- ifelse(is.null(metadata), list(name = deparse(substitute(tbl))), metadata)
  if (is.null(metadata)) {
    dict$metadata <- list(name = deparse(substitute(tbl)))
  } else {
    dict$metadata <- metadata
  }

  do.call(Dict, dict)
}
