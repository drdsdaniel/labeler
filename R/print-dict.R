#' Print Method for Dict Objects
#'   `r lifecycle::badge("experimental")`
#'
#' @param x A Dict object.
#' @param ... Further arguments passed to or from other methods.
#'
#' @return Invisibly returns the Dict object.
#' @export
#'
#' @examples
#' \dontrun{
#'     print(lbl_df_dict)
#' }
print.Dict <- function(x, ...) {
  cat(paste0("Dictionary for '", x$metadata[["name"]], "', with ", length(x) - 1, " variables.\n"))
  for (.meta in names(x$metadata)) {
    cat(paste0("  ", .meta, ": ", x$metadata[[.meta]], "\n"))
  }
  # TODO: Not all will have a dtype...
  # types <- list()
  # for (var_name in names(x)) {
  #   if (var_name == "metadata") next
  #   if (is.null(x[[var_name]]$dtype)) {
  #     next
  #   }
  #   type <- x[[var_name]]$dtype
  #   if (is.null(types[[type]])) {
  #     types[[type]] <- list()
  #   }
  #   types[[type]] <- c(types[[type]], var_name)
  # }
  # for (type in names(types)) {
  #   cat(paste0("  ", type, ": ", paste(types[[type]], collapse = ", "), "\n"))
  # }
}
