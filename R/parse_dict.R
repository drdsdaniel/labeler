#' Replace non ASCII characters with ASCII equivalents
#'
#' @param dict A dictionary. See vignette('labeler') for details.
#'
#' @return A dictionary with all non ASCII characters replaced with ASCII
#' @export
#'
#' @examples
#' \dontrun{
#'    parse_dict(dict)
#'  }
parse_dict <- function(dict) {
    for (var in names(dict)) {
        lab <- readr::parse_character(dict[[var]][["lab"]])
        dict[[var]][["lab"]] <- lab
        labs <- names(dict[[var]][["labs"]])
        if (!is.null(labs)) {
            if (length(labs) > 1) {
                for (lab in seq_along(labs)) {
                    labs[[lab]] <- readr::parse_character(labs[[lab]])
                }
            }
            names(dict[[var]][["labs"]]) <- labs
        }
    }
    return(dict)
}
