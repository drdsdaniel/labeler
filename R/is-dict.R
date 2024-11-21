#' Is Method for Dict Objects
#' `r lifecycle::badge("experimental")`
#'
#' @param x The object to check.
#'
#' @return TRUE if x is a valid Dict object, FALSE otherwise.
#' @export
#'
#' @examples
#' \dontrun{
#' is.Dict(lbl_df_dict)
#' }
is.Dict <- function(x) {
  # browser()
  if (!inherits(x, "Dict")) {
    return(FALSE)
  }

  if (!is.list(x$metadata)) {
    return(FALSE)
  }
  if (length(x$metadata) < 1) {
    return(FALSE)
  }
  if (!is.character(x$metadata[["name"]])) {
    return(FALSE)
  }

  for (.var in names(x)) {
    if (.var %in% c("metadata")) next
    if (!is.list(x[[.var]])) {
      return(FALSE)
    }
    # if (length(x[[.var]]) != 3) {
    #   return(FALSE)
    # }
    if (!is.character(x[[.var]][["label"]])) {
      return(FALSE)
    }
    # if (!is.vector(x[[.var]][["labels"]])) {
    #   return(FALSE)
    # }
    # if (!is.character(x[[.var]][["dtype"]])) {
    #   return(FALSE)
    # }
  }

  return(TRUE)
}
