#' Browse a Data Dictionary Interactively
#' `r lifecycle::badge("experimental")`
#'
#' Displays a data dictionary in an interactive web interface using the DT package.
#' Accepts either a `Dict` object or a labeled `data.frame` as input.
#'
#' @param x A `Dict` object or a labeled `data.frame`.
#' @param .interactive Logical. If TRUE (default and when interactive session is detected),
#'   an interactive DT::datatable is displayed. If FALSE, a data frame representation of
#'   the dictionary is returned.
#'
#' @return An interactive DT::datatable (if `.interactive` is TRUE) or a data frame
#'   representation of the dictionary (if `.interactive` is FALSE).
#' @export
#'
#' @examples
#' \dontrun{
#'     # Passing a Dict object
#'     dict_browser(lbl_df_dict)
#'     # Passing a labeled data.frame will automatically generate a Dict object
#'     dict_browser(set_Dict(lbl_df, lbl_df_dict))
#'    
#'     # For non-interactive use:
#'     df <- dict_browser(lbl_df_dict, .interactive = FALSE)
#'     print(df)
#' }
dict_browser <- function(x, .interactive = interactive()) {
  if (is.Dict(x)) {
    tab <- x |>
      as.data.frame()
  } else if (is.data.frame(x)) {
    tab <- x |>
      gen_Dict() |>
      as.data.frame()
  } else {
    stop("x must be a ?Dict or labelled data.frame")
  }

  if (.interactive) {
    rlang::check_installed("DT")
    tab |>
      dplyr::mutate(labels = labels) |> # TODO: Apply html to improve read...
      DT::datatable()
  } else {
    tab
  }
}
