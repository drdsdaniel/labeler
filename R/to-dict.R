#' Convert a Data Frame or list to a Dict Object
#' `r lifecycle::badge("experimental")`
#'
#' Converts a data frame or list representing a data dictionary to a Dict object.
#'
#' @param x A data frame with columns "name", "label", "labels", "dtype".
#' @param metadata A list containing metadata for the Dict object (optional).
#'   It must contain at least a "name" element.
#'   If NULL, the name of the dataset will be used.
#' @param ... Additional arguments (currently ignored).
#'
#' @return A Dict object representing the data dictionary.
#' @export
#'
#' @examples
#' \dontrun{
#'     df_dict <- as.data.frame(lbl_df_dict)
#'     my_dict <- as.Dict(df_dict)
#' }
as.Dict <- function(x, metadata = NULL, ...) {
  # if (!is.data.frame(x)) {
  #   stop("`x` must be a data frame. See ?data.frame for details.")
  # }

  is_df <- is.data.frame(x)
  isOldDict <- is_old_dict(x)

  if (!any(c(is_df, isOldDict))) {
    stop("`x` must be a data frame or a list. See ?Dict for details.")
  }

  if (is_df) {
    required_cols <- c("name", "label", "labels", "dtype")
    if (!all(required_cols %in% names(x))) {
      missing_cols <- required_cols[!required_cols %in% names(x)]
      stop(paste("Missing required columns:", paste(missing_cols, collapse = ", ")))
    }

    dict <- list()
    for (i in 1:nrow(x)) {
      var_name <- x$name[i]
      if (var_name == "") {
        stop(paste("Variable name is missing or cannot be extracted from label in row", i))
      }

      dict[[var_name]] <- list(
        name = var_name,
        label = x$label[i],
        labels = .parse_labels_df(x$labels[i]),
        dtype = x$dtype[i]
      )
    }
  } else {
    dict <- dict2Dict(x)
  }

  if (is.null(metadata)) {
    metadata <- attr(x, "dict_metadata")
  }
  if (is.null(metadata)) {
    metadata <- list(name = deparse(substitute(x)))
  }
  dict$metadata <- metadata

  structure(dict, class = "Dict")
}




# Helper function to parse labels from data frame representation
.parse_labels_df <- function(labels_str) {
  if (labels_str == "") {
    return(NULL)
  }

  labels_list <- strsplit(labels_str, ";")[[1]]
  labels <- numeric(length(labels_list))
  names(labels) <- character(length(labels_list))

  for (i in seq_along(labels_list)) {
    parts <- strsplit(labels_list[i], "=")[[1]]
    names(labels)[i] <- trimws(parts[1])
    labels[i] <- as.numeric(trimws(parts[2]))
  }
  return(labels)
}



dict2Dict <- function(dict, metadata = NULL) {
  lapply(exclude_links(dict), renamer)
}

exclude_links <- function(lista) {
  sublistas_con_link <- sapply(lista, function(sublista) {
    ("lab" %in% names(sublista) && grepl("^link::", sublista[["lab"]][[1]])) ||
    ("labs" %in% names(sublista) && grepl("^link::", sublista[["labs"]][[1]]))
  })
  
  if (any(sublistas_con_link)) {
    warning("At least one element contains a link. It will be ignored.")
  }
  
  lista_filtrada <- lista[!sublistas_con_link]
  
  return(lista_filtrada)
}

renamer <- function(sublist) {
  if ("lab" %in% names(sublist)) {
    names(sublist)[names(sublist) == "lab"] <- "label"
  }
  # Verificar si 'labs' está en los nombres y cambiarlo a 'labels'
  if ("labs" %in% names(sublist)) {
    names(sublist)[names(sublist) == "labs"] <- "labels"
  }
  return(sublist)
}

is_old_dict <- function(dict) {
  if (!is.list(dict)) {
    return(FALSE)
  }
  if (length(dict) < 1) {
    return(FALSE)
  }
  if (!inherits(dict[[1]], "list")) {
    return(FALSE)
  }
  if (any(names(dict[[1]]) != c("lab", "labs"))) {
    return(FALSE)
  }
  return(TRUE)
}
