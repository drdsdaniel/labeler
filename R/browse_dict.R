#' Browse dictionary
#'
#'  Allows you to browse the dictionary of the surveys in a web interface where
#'  you can check the name and label of the variables, as well as the data labels.
#'
#' @param dict database dictionary
#'
#' @return a web interface with the data contained in the supplied dictionary
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
browse_dict <- function(dict) {
  datos <- data.frame(var = character(), lab = character(), labs = character())
  for (name in names(dict)) {
    datos[nrow(datos) + 1, "var"] <- name
    lab <- dict[[name]]$lab
    lab <- validateLab(lab, dict)
    datos[nrow(datos), "lab"] <- decode_lab(lab)
    labs <- dict[[name]]$labs
    labs <- validateLabs(labs, dict)
    labs <- decode_labs(labs)
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
    datos[nrow(datos), "labs"] <- paste0(labs2, "</div>")
  }
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
