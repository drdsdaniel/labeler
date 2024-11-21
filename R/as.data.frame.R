#' Convert a Dict Object to a Data Frame
#' `r lifecycle::badge("experimental")`
#'
#' Converts a Dict object to a data frame, where each row represents a variable
#' and columns contain the variable's metadata (name, label, dtype, labels).
#'
#' @param x A Dict object.
#' @param row.names NULL or a character vector giving the row names for the data frame.
#'   Missing values are not allowed.
#' @param optional Logical. If TRUE, setting row names and converting column names
#'   (to syntactic names: see make.names) is optional.
#' @param ... Additional arguments (currently ignored).
#'
#' @return A data frame representing the Dict object.
#' @export
#'
#' @examples
#' \dontrun{
#'     df <- as.data.frame(lbl_df_dict)
#'     print(df)
#' }
as.data.frame.Dict <- function(x, row.names = NULL, optional = FALSE, ...) {
  if (!is.Dict(x)) {
    stop("`x` must be a Dict object. See ?Dict for details.")
  }

  data <- data.frame(
    name = character(),
    label = character(),
    labels = character(),
    dtype = character(),
    stringsAsFactors = FALSE
  )

  for (var_name in names(x)) {
    if (var_name == "metadata") next

    data <- data |>
      dplyr::add_row(
        name = var_name,
        label = x[[var_name]]$label,
        labels = .format_labels_df(x[[var_name]]$labels),
        dtype = x[[var_name]]$dtype,
      )
  }

  if (!is.null(row.names)) {
    rownames(data) <- row.names
  }

  attr(data, "dict_metadata") <- x$metadata

  return(data)
}

# Helper function to format labels for data frame representation
.format_labels_df <- function(labels) {
  if (is.null(labels)) {
    return("")
  }

  labels_str <- ""
  for (i in seq_along(labels)) {
    labels_str <- paste0(labels_str, names(labels)[i], "=", labels[i], ifelse(i < length(labels), ";", ""))
  }
  return(labels_str)
}
