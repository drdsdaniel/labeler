#' Generate a dictionary of given dataset
#' `r lifecycle::badge("experimental")`
#'
#' @param tbl A labelled dataset
#'
#' @return A dictionary of the dataset
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  get_dict(tbl)
#' }
get_dict <- function(tbl){
  dict0 <- labelled::generate_dictionary(tbl)
  dict <- list()
  for (row in 1:nrow(dict0)) {
    variable <- dict0[["variable"]][[row]]
    lab <- dict0[["label"]][[row]]
    labs <- dict0[["value_labels"]][[row]]
    dict[[variable]] <- list()
    if(!all(is.na(labs))){
      dict[[variable]][["labs"]] <- labs
      dict[[variable]][["lab"]] <- ""
    }
    if(!is.na(lab)){
      dict[[variable]][["lab"]] <- lab
    }
    if(length(dict[[variable]]) == 0){
      dict[[variable]] <- NULL
    }
  }
  dict
}

