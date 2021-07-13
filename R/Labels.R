#' Assign data labels to specified variables
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param tbl [data.frame]: Data.frame with the data
#' @param vars [character]: If specified, only labels are assigned to those variables
#' @param dict [data.frame]: Dictionary with all the data labels to use
#' @param ignore_case [logical]: Indicate if case sensitive should be ignored.
#'
#' @return The data entered in the \code{tbl} argument but with data labels
#'
#'
#' @seealso
#'   Data labels \code{vignette("labeler", package = "labeler")}
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   dict <- list(
#'     SEX = list(
#'       lab = "Sex of the person",
#'       labs = c(
#'         "Man" = 1,
#'         "Woman" = 2
#'       )
#'     )
#'   )
#'   df <- data.frame(SEX = c(1, 2))
#'   str(df)
#'   str(set_labels(df, dict = dict))
#'}
set_labels <- function(tbl, vars = NULL, dict, ignore_case = FALSE) {
  if(!is.null(vars)){
    names <- vars
  } else if(!is.null(tbl)){ # Validar luego las clases de tbl admitidas
    names <- names(tbl)
  } else {
    names <- NULL
  }
  if (all(!is.null(tbl), !is.null(names))) {
    for (name in names) {
      if (ignore_case){
        name <- names(dict)[tolower(names(dict)) == tolower(name)]
      }
      tryCatch({
        lab <- dict[[name]]$lab
        labs <- dict[[name]]$labs
        lab <- validateLab(lab, dict)
        labs <- validateLabs(labs, dict)
        name <- names(tbl)[tolower(names(tbl)) == tolower(name)]
        tbl <- labellize(tbl, name, lab, labs)},
        error = function(e){

        })
    }
  }
  tbl
}

setLabels <- function(tbl, vars = NULL, dict, ignore_case = FALSE) {
  deprecate_warn("0.1.1", "endomer::setLabels()", "set_labels()")
  set_labels(tbl, vars, dict, ignore_case)
}



validateLab <- function(lab, dict) {
  if (all(!is.null(lab), is.character(lab))) {
    if (startsWith(lab, "link::")) {
      link <- strsplit(lab, "::")[[1]][[2]]
      lab <- dict[[link]]$lab
      lab <- validateLab(lab, dict)
    }
  } else {
    lab <- NULL
  }
  stringi::stri_unescape_unicode(lab)
}

validateLabs <- function(labs, dict) {
  if (!is.null(labs)) {
    if (all(length(labs) == 1, is.character(labs))) {
      if (startsWith(labs, "link::")) {
        link <- strsplit(labs, "::")[[1]][[2]]
        labs <- dict[[link]]$labs
        labs <- validateLabs(labs, dict)
      }
    }
    if (is.null(names(labs))) {
      labs <- NULL
    }
  }
  if(!is.null(names(labs))){
    names(labs) <- stringi::stri_unescape_unicode(names(labs))
  }
  labs
}


labellize <- function(tbl, var_name, lab, labs) {
  if (!is.null(lab)) {
    tbl[[var_name]] <- sjlabelled::set_label(tbl[[var_name]], label = lab)
  }
  if (!is.null(labs)) {
    tbl[[var_name]] <- sjlabelled::set_labels(tbl[[var_name]], labels = labs)
  }
  tbl
}





#' Use the data labels of a variable
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param tbl [data.frame]: Data.frame with the data
#' @param vars [character]: If specified, only labels are assigned to those variables
#' @param dict [data.frame]:Dictionary with all the data labels to use if they
#'   have not yet been assigned. See \code{Details}
#' @param ignore_case [logical]: Indicate if case sensitive should be ignored
#'
#' @return The data supplied in the \code{tbl} argument, but instead of values
#'   using the corresponding data labels
#'
#' @details This function assumes that the data labels have been assigned to the
#'   data before, unless a \code{dict} is supplied, in which case the latter
#'   will be used to assign and use the data labels.
#'
#' @seealso
#'   Data labels \code{vignette("labeler", package = "labeler")}
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   dict <- list(
#'     SEX = list(
#'       lab = "Sex of the person",
#'       labs = c(
#'         "Man" = 1,
#'         "Woman" = 2
#'       )
#'     )
#'    )
#'   enft <- data.frame(SEX = c(1, 2))
#'   enft
#'   use_labels(enft, dict = dict)
#'}
use_labels <- function(tbl, vars = NULL, dict = NULL, ignore_case = F) {
  if(!is.null(dict)){
    tbl <- set_labels(tbl, vars, dict, ignore_case)
  }
  if(!is.null(vars)){
    names <- vars
  } else if(!is.null(tbl)){ # Validar luego las clases de tbl admitidas
    names <- names(tbl)
  } else {
    names <- NULL
  }
  if (all(!is.null(tbl), !is.na(vars))) {
    for (name in names) {
      tbl[, name] <- asLabels(tbl[, name])
    }
    tbl
  }
}

useLabels <- function(tbl, vars = NULL, dict = NULL) {
  deprecate_warn("0.1.1", "endomer::useLabels()", "use_labels()")
  use_labels(tbl, vars, dict)
}




asLabels <- function(var) {
  tryCatch(
    {
      sjlabelled::as_label(var)
    },
    error = function(e) {
      var
    }
  )
}




