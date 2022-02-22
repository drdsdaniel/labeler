#' Replace non ASCII characters with ASCII equivalents
#' `r lifecycle::badge('experimental')`
#'
#' @param dict A dictionary. See `vignette('labeler', package = "labeler")` for details.
#'
#' @return A dictionary with all non ASCII characters replaced with ASCII
#' @export
#'
#' @examples
#' \dontrun{
#'    dict = list(
#'              MARRIED = list(
#'                "Sí" = 1,
#'                "No" = 2
#'              )
#'            )
#'    parse_dict(dict)
#'  }
parse_dict <- function(dict) {
    for (var in names(dict)) {
      if(!(var %in% c("encoding"))){
        lab <- dict[[var]][["lab"]]
        dict[[var]][["lab"]] <- ifelse(any(is.null(lab), lab == ""), "", readr::parse_character(lab))
        labs <- names(dict[[var]][["labs"]])
        if (!is.null(labs)) {
            if (length(labs) > 1) {
                for (lab in seq_along(labs)) {
                    labs[[lab]] <- readr::parse_character(labs[[lab]])
                }
            }
            names(dict[[var]][["labs"]]) <- labs
        }
        warn <- dict[[var]][["warn"]]
        if(!is.null(warn)) {
            warn <- readr::parse_character(warn)
            dict[[var]][["warn"]] <- warn
        }
      }
    }
    return(dict)
}

