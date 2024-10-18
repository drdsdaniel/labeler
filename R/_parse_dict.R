# Replace non ASCII characters with ASCII equivalents
# `r lifecycle::badge('experimental')`
#
# @param dict [list] A dictionary. See `vignette('labeler', package = "labeler")` for details.
# @param .decode [logical] If FALSE (default) the file is encoded for safe writing.
# If TRUE the file is decode to UTF-8.
#
# @return A dictionary with all non ASCII characters replaced with ASCII
# @export
#
# @examples
# \dontrun{
#    dict = list(
#              MARRIED = list(
#                "Sí" = 1,
#                "No" = 2
#              )
#            )
#    parse_dict(dict)
#  }
parse_dict <- function(dict, .decode = FALSE) {
    for (var in names(dict)) {
      if(!(var %in% c("encoding"))){
        lab <- dict[[var]][["lab"]]
        dict[[var]][["lab"]] <- ifelse(
          any(
            is.null(lab),
            lab == ""
          ),
          "",
          ifelse(.decode, iconv(lab, to = "utf8"), readr::parse_character(lab)) #iconv(lab, to = "utf8")
        )
        labs <- names(dict[[var]][["labs"]])
        if (!is.null(labs)) {
            if (length(labs) > 1) {
                for (lab in seq_along(labs)) {
                    labs[[lab]] <- ifelse(.decode,iconv(labs[[lab]], to = "utf8") ,readr::parse_character(labs[[lab]])) #iconv(labs[[lab]], to = "utf8")
                }
            }
            names(dict[[var]][["labs"]]) <- labs
        }
        warn <- dict[[var]][["warn"]]
        if(!is.null(warn)) {
            warn <- ifelse(.decode, iconv(warn, to = "utf8"), readr::parse_character(warn)) #iconv(warn, to = "utf8")
            dict[[var]][["warn"]] <- warn
        }
      }
    }
    return(dict)
}

