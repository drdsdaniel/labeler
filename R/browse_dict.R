#' Browse Dictionary
#' `r lifecycle::badge('experimental')`
#'
#' Allows you to browse the dictionary of the surveys in a web interface, where
#' you can check the names and labels of the variables, as well as their data labels.
#'
#' @param dict A list representing the database dictionary. If not a list, it will be processed by \code{\link{get_dict}}.
#' @param ... Additional arguments for testing purposes.
#'
#' @return A web interface displaying the data contained in the supplied dictionary.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' dict <- list(
#'   SEX = list(
#'     lab = "Sex of the person",
#'     labs = c("Man" = 1, "Woman" = 2)
#'   ),
#'   MARITAL_STATUS = list(
#'     lab = "Marital status of the person",
#'     labs = c("Single" = 1, "Married" = 2, "Widower" = 3)
#'   ),
#'   HEIGHT = list(
#'     lab = "Person height",
#'     labs = c("Short" = 1, "Normal" = 2, "High" = 3)
#'   )
#' )
#' browse_dict(dict)
#' }
browse_dict <- function(dict, ...) {
  .args <- list(...)
  testing <- isTRUE(.args$testing)

  if (!inherits(dict, "list")) dict <- get_dict(dict)

  datos <- init_datos()

  enc <- dict[["encoding"]]
  if (is.null(enc)) enc <- ""
  dict <- dict[names(dict) != "encoding"]

  for (name in names(dict)) {
    datos <- datos |>
      dplyr::add_row(
        var = name,
        lab = get_lab(dict, name),
        warn = get_warn(dict, name),
        labs = get_labs(dict, name)
      )
  }


  if (testing) {
    datos
  } else {
    generate_dt(datos)
  }
}



get_lab <- function(dict, name) {
  lab <- dict[[name]]$lab
  lab <- validateLab(lab, dict)
  datos[nrow(datos), "lab"] <- decode_lab(lab, enc)
}


get_warn <- function(dict, name) {
  warn <- dict[[name]]$warn
  if (!is.null(warn)) {
    decode_warn(warn, enc)
  } else {
    warn
  }
}


get_labs <- function(dict, name) {
  labs <- dict[[name]]$labs
  labs <- validateLabs(labs, dict)
  labs <- decode_labs(labs, enc)
  labs2 <- "<div>"
  for (lab in seq_along(labs)) {
    labs2 <- paste0(
      labs2,
      labs[[lab]],
      ": ",
      names(labs)[[lab]],
      "<br />"
    )
  }
  paste0(labs2, "</div>")
}



init_datos <- function() {
  data.frame(
    var = character(),
    lab = character(),
    labs = character(),
    warn = character()
  )
}


generate_dt <- function(datos) {
  DT::datatable(datos,
    escape = FALSE, width = "100%",
    options = list(
      autoWidth = FALSE,
      columnDefs = list(
        list(width = "40%", targets = c(2, 3)),
        list(targets = c(2), className = "dt-top")
      )
    )
  )
}
