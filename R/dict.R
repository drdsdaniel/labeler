#' Dict Class
#' `r lifecycle::badge("experimental")`
#'
#' Represents a data dictionary containing metadata and variable definitions.
#'
#' @param ... Named lists, each representing a variable in the dictionary.
#' @param metadata A list containing metadata about the dictionary itself.
#'
#' @details
#' Each variable list should contain the following elements:
#' * **label:** A character string representing a short, unique identifier for the variable
#'   and a character string describing the variable. This can be a long, descriptive label.
#'   To provide both a short and a long label, separate them with "||".
#'   For example: "Age || Age of the respondent".
#'   Use \code{set_Dict(label_type=)} argument to choose the desired label type.
#'   By default, the full label (including both parts) will be used.
#' * **labels:** (optional) A named vector or list defining the value labels for the variable.
#' * **dtype:** (optional) A character string specifying the desired data type of the variable.
#'
#' The **`metadata`** list can contain any relevant information about the dictionary,
#' such as the source of the data, creation date, etc. It must contain at least a "name" element.
#'
#' @return An object of class "Dict".
#' @export
#'
#' @examples
#' \dontrun{
#'     lbl_df_dict |> unclass()
#'     is.Dict(lbl_df_dict)
#'     lbl_df_dict
#' }
Dict <- function(..., metadata) {
  # browser()
  if (!is.list(metadata) || length(metadata) < 1) stop("Invalid metadata. Must be a list with at least one element. See ?Dict for more details.")
  if (!is.character(metadata[["name"]])) stop("Invalid metadata. Must have a valid name element. See ?Dict for more details.")

  .args <- list(...)
  for (.arg in names(.args)) {
    if (!is.list(.args[[.arg]])) stop(paste0("Invalid argument: ", .arg, ". Must be a list. See ?Dict for more details."))
    # if (length(.args[[.arg]]) != 3) stop(paste0("Invalid argument: ", .arg, ". Must have 4 elements. See ?Dict for more details."))
    # if (!is.character(.args[[.arg]][["name"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a name element. See ?Dict for more details."))
    if (!is.character(.args[[.arg]][["label"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a label element. See ?Dict for more details."))
    # if (!is.vector(.args[[.arg]][["labels"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a labels element. See ?Dict for more details."))
    # if (!is.character(.args[[.arg]][["dtype"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a dtype element. See ?Dict for more details."))
    # if (!.args[[.arg]][["dtype"]] %in% c("logical", "integer", "numeric", "character", "Date", "POSIXct", "POSIXlt", "NULL")) {
    #   stop(paste0("Invalid argument: ", .arg, ". Must have a valid dtype element. See ?Dict for more details."))
    # }
  }

  structure(list(metadata = metadata, ...), class = "Dict")
}