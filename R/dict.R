#' Dict Class
#' `r lifecycle::badge("experimental")`
#'
#' Represents a data dictionary containing metadata and variable definitions.
#'
#' @param ... Named lists, each representing a variable in the dictionary.
#' @param metadata A list containing metadata about the dictionary itself.
#'
#' @details
#' Each variable list should contain the following elements:
#' * **label:** A character string representing a short, unique identifier for the variable
#'   and a character string describing the variable. This can be a long, descriptive label.
#'   To provide both a short and a long label, separate them with "||".
#'   For example: "Age || Age of the respondent".
#'   Use \code{set_Dict(label_type=)} argument to choose the desired label type.
#'   By default, the full label (including both parts) will be used.
#' * **labels:** A named vector or list defining the value labels for the variable.
#' * **dtype:** A character string specifying the desired data type of the variable.
#'    The value "NULL" (as a string) indicates that the existing data type of the variable should be preserved.
#'
#' The **`metadata`** list can contain any relevant information about the dictionary,
#' such as the source of the data, creation date, etc. It must contain at least a "name" element.
#'
#' @return An object of class "Dict".
#' @export
#'
#' @examples
#' my_dict <- Dict(
#'   age = list(
#'     label = "Age || Age of the respondent", # Short and long label
#'     labels = c("Under 18" = 1, "18-24" = 2, "25-34" = 3),
#'     dtype = "integer"
#'   ),
#'   gender = list(
#'     label = "Gender",
#'     labels = c("Male" = 1, "Female" = 2),
#'     dtype = "NULL" # Keep the original data type
#'   ),
#'   metadata = list(name = "My Survey Dictionary", version = "1.0")
#' )
#'
#' is.Dict(my_dict)
#' print(my_dict)
Dict <- function(..., metadata) {
  # browser()
  if (!is.list(metadata) || length(metadata) < 1) stop("Invalid metadata. Must be a list with at least one element. See ?Dict for more details.")
  if (!is.character(metadata[["name"]])) stop("Invalid metadata. Must have a valid name element. See ?Dict for more details.")

  .args <- list(...)
  for (.arg in names(.args)) {
    if (!is.list(.args[[.arg]])) stop(paste0("Invalid argument: ", .arg, ". Must be a list. See ?Dict for more details."))
    # if (length(.args[[.arg]]) != 3) stop(paste0("Invalid argument: ", .arg, ". Must have 4 elements. See ?Dict for more details."))
    # if (!is.character(.args[[.arg]][["name"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a name element. See ?Dict for more details."))
    if (!is.character(.args[[.arg]][["label"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a label element. See ?Dict for more details."))
    # if (!is.vector(.args[[.arg]][["labels"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a labels element. See ?Dict for more details."))
    if (!is.character(.args[[.arg]][["dtype"]])) stop(paste0("Invalid argument: ", .arg, ". Must have a dtype element. See ?Dict for more details."))
    # if (!.args[[.arg]][["dtype"]] %in% c("logical", "integer", "numeric", "character", "Date", "POSIXct", "POSIXlt", "NULL")) {
    #   stop(paste0("Invalid argument: ", .arg, ". Must have a valid dtype element. See ?Dict for more details."))
    # }
  }

  structure(list(metadata = metadata, ...), class = "Dict")
}




#' Is Method for Dict Objects
#' `r lifecycle::badge("experimental")`
#'
#' @param x The object to check.
#'
#' @return TRUE if x is a valid Dict object, FALSE otherwise.
#' @export
is.Dict <- function(x) {
  # browser()
  if (!inherits(x, "Dict")) {
    return(FALSE)
  }

  if (!is.list(x$metadata)) {
    return(FALSE)
  }
  if (length(x$metadata) < 1) {
    return(FALSE)
  }
  if (!is.character(x$metadata[["name"]])) {
    return(FALSE)
  }

  for (.var in names(x)) {
    if (.var %in% c("metadata")) next
    if (!is.list(x[[.var]])) {
      return(FALSE)
    }
    # if (length(x[[.var]]) != 3) {
    #   return(FALSE)
    # }
    if (!is.character(x[[.var]][["label"]])) {
      return(FALSE)
    }
    # if (!is.vector(x[[.var]][["labels"]])) {
    #   return(FALSE)
    # }
    if (!is.character(x[[.var]][["dtype"]])) {
      return(FALSE)
    }
  }

  return(TRUE)
}




#' Print Method for Dict Objects
#'
#' @param x A Dict object.
#' @param ... Further arguments passed to or from other methods.
#'
#' @return Invisibly returns the Dict object.
#' @export
print.Dict <- function(x, ...) {
  cat(paste0("Dictionary for '", x$metadata[["name"]], "', with ", length(x) - 1, " variables.\n"))
  for (.meta in names(x$metadata)) {
    cat(paste0("  ", .meta, ": ", x$metadata[[.meta]], "\n"))
  }
  types <- list()
  for (var_name in names(x)) {
    if (var_name == "metadata") next
    if (is.null(x[[var_name]]$dtype)) {
      next
    }
    type <- x[[var_name]]$dtype
    if (is.null(types[[type]])) {
      types[[type]] <- list()
    }
    types[[type]] <- c(types[[type]], var_name)
  }
  for (type in names(types)) {
    cat(paste0("  ", type, ": ", paste(types[[type]], collapse = ", "), "\n"))
  }
}





#' Generate a Dictionary from a Dataset
#' `r lifecycle::badge("experimental")`
#'
#' Creates a Dict object from a labeled dataset (data.frame or tibble).
#'
#' @param tbl A labeled dataset.
#' @param metadata (Optional) A list containing metadata for the dictionary.
#'   If NULL, the name of the dataset will be used.
#'
#' @return A Dict object representing the dictionary of the dataset.
#' @export
#'
#' @examples
#' # Assuming 'lbl_df' is a labeled dataset
#' my_dict <- gen_Dict(lbl_df)
gen_Dict <- function(tbl, metadata = attributes(lbl_df)$dict_metadata) {
  # browser()
  dict0 <- labelled::generate_dictionary(tbl)
  dict <- list()
  for (.row in 1:nrow(dict0)) {
    variable <- dict0[["variable"]][[.row]]
    label <- dict0[["label"]][[.row]]
    labels <- dict0[["value_labels"]][[.row]]
    dtype <- class(tbl[[variable]])
    # name <- NULL

    # if (!is.null(labels)) {
    dict[[variable]] <- list(
      label = ifelse(is.na(label), variable, label),
      # name = name,
      labels = labels,
      dtype = dtype
    )
    # }
  }
  # dict$metadata <- ifelse(is.null(metadata), list(name = deparse(substitute(tbl))), metadata)
  if (is.null(metadata)) {
    dict$metadata <- list(name = deparse(substitute(tbl)))
  } else {
    dict$metadata <- metadata
  }

  do.call(Dict, dict)
}


#' Convert a Dict Object to a Data Frame
#' `r lifecycle::badge("experimental")`
#'
#' Converts a Dict object to a data frame, where each row represents a variable
#' and columns contain the variable's metadata (name, label, type, labels).
#'
#' @param x A Dict object.
#' @param row.names NULL or a character vector giving the row names for the data frame.
#'   Missing values are not allowed.
#' @param optional Logical. If TRUE, setting row names and converting column names
#'   (to syntactic names: see make.names) is optional.
#' @param ... Additional arguments (currently ignored).
#'
#' @return A data frame representing the Dict object.
#' @export
#'
#' @examples
#' # Assuming 'my_dict' is a Dict object
#' df <- as.data.frame(my_dict)
#' print(df)
as.data.frame.Dict <- function(x, row.names = NULL, optional = FALSE, ...) {
  if (!is.Dict(x)) {
    stop("`x` must be a Dict object. See ?Dict for details.")
  }

  data <- data.frame(
    name = character(),
    label = character(),
    type = character(),
    labels = character(),
    stringsAsFactors = FALSE
  )

  for (var_name in names(x)) {
    if (var_name == "metadata") next

    data <- data |>
      dplyr::add_row(
        name = var_name,
        label = x[[var_name]]$label,
        type = x[[var_name]]$dtype,
        labels = .format_labels_df(x[[var_name]]$labels),
      )
  }

  if (!is.null(row.names)) {
    rownames(data) <- row.names
  }

  attr(data, "dict_metadata") <- x$metadata

  return(data)
}

# Helper function to format labels for data frame representation
.format_labels_df <- function(labels) {
  if (is.null(labels)) {
    return("")
  }

  labels_str <- ""
  for (i in seq_along(labels)) {
    labels_str <- paste0(labels_str, names(labels)[i], "=", labels[i], ifelse(i < length(labels), ";", ""))
  }
  return(labels_str)
}



#' Convert a Data Frame to a Dict Object
#' `r lifecycle::badge("experimental")`
#'
#' Converts a data frame representing a data dictionary to a Dict object.
#'
#' @param x A data frame with columns "name", "label", "type", "labels".
#' @param metadata A list containing metadata for the Dict object (optional).
#' @param ... Additional arguments (currently ignored).
#'
#' @return A Dict object representing the data dictionary.
#' @export
#'
#' @examples
#' # Assuming 'df' is a data frame with appropriate columns
#' my_dict <- as.Dict(df)
as.Dict <- function(x, metadata = NULL, ...) {
  if (!is.data.frame(x)) {
    stop("`x` must be a data frame. See ?data.frame for details.")
  }

  required_cols <- c("name", "label", "type", "labels")
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
      dtype = x$type[i]
    )
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


#' Apply a Dictionary to a Dataset
#' `r lifecycle::badge("experimental")`
#'
#' Applies labels and data types defined in a Dict object to a dataset.
#'
#' @param tbl A data.frame or tibble.
#' @param dict A Dict object.
#' @param subset (Optional) A character vector specifying the variables to which the dictionary should be applied.
#'   If NULL (default), the dictionary is applied to all variables in the dataset that are also present in the dictionary.
#' @param dtypes Logical, indicating whether to apply data types defined in the dictionary (default is TRUE).
#' @param label_type Character string specifying how variable labels should be applied.
#'   Options are "full" (default, uses the entire label), "label" (uses the part after "||"), or "name" (uses the part before "||").
#'   See \code{Dict} for more details.
#'
#' @return The dataset with labels and data types applied according to the dictionary.
#' @export
#'
#' @examples
#' # Assuming 'my_data' is a data.frame and 'my_dict' is a Dict object
#' labeled_data <- set_Dict(my_data, my_dict)
set_Dict <- function(tbl, dict, subset = NULL, dtypes = TRUE, label_type = c("full", "label", "name")) {
  # browser()
  if (!is.Dict(dict)) stop("dict must be a Dict object. See ?Dict for more details.")
  if (!is.data.frame(tbl)) stop("tbl must be a data.frame. See ?data.frame for more details.")

  label_type <- ifelse(length(label_type) > 1, label_type[1], label_type)
  label_type <- match.arg(label_type, c("full", "label", "name"))

  attr(tbl, "dict_metadata") <- dict$metadata

  if (!is.null(subset)) {
    if (!is.character(subset)) stop("subset must be a character vector of variable names.")
  } else {
    subset <- names(dict[!names(dict) %in% c("metadata")])
  }

  missing_vars <- character()
  for (variable in subset) {
    if (!variable %in% names(tbl)) {
      missing_vars <- c(missing_vars, variable)
      next
    }

    if (dtypes) {
      tbl <- .apply_Dict_types(tbl, dict, subset)
    }
    .label <- dict[[variable]][["label"]]
    .label <- switch(label_type,
      full = .label,
      name = trimws(gsub("\\|\\|.*", "", .label)),
      label = trimws(gsub(".*\\|\\|", "", .label))
    )
    .labels <- dict[[variable]][["labels"]]
    tbl[[variable]] <- haven::labelled(
      tbl[[variable]],
      labels = .labels,
      label = .label
    )
  }

  if (length(missing_vars) > 0) {
    warning("Variables ", paste0(missing_vars, collapse = ", "), " not found in tbl. They will be ignored.")
  }

  tbl
}


.apply_Dict_types <- function(tbl, dict, subset = NULL) {
  for (variable in subset) {
    if (!variable %in% names(tbl)) {
      # missing_vars <- c(missing_vars, variable)
      next
    }

    if (!is.null(dict[[variable]][["dtype"]])) {
      if (dict[[variable]][["dtype"]] != "NULL") {
        class(tbl[[variable]]) <- dict[[variable]][["dtype"]]
      }
    }
  }

  return(tbl)
}


#   lbl_df |> use_Dict(lbl_df_dict) |> dplyr::count(sex, haven::as_factor(sex)) |> haven::as_factor()
#   lbl_df |> use_Dict(lbl_df_dict) |> dplyr::pull(sex) |> str()
#   lbl_df |> use_Dict(lbl_df_dict) |> dplyr::select(sex)
#   lbl_df |> use_Dict(lbl_df_dict) |> dplyr::count(sex) |> sjlabelled::label_to_colnames() |> sjlabelled::as_label()


#' Work with a Dataset Using a Dictionary
#' `r lifecycle::badge("experimental")`
#'
#' A convenience function to apply a dictionary to a dataset and optionally convert variables to factors
#' with labels as levels or replace column names with variable labels.
#'
#' @param tbl A data.frame or tibble.
#' @param dict A Dict object (optional). If NULL, it assumes the dataset already has a dictionary applied.
#' @param subset (Optional) A character vector specifying variables to work with.
#' @param use_label Logical, indicating whether to replace column names with variable label (default is TRUE).
#' @param use_labels Logical, indicating whether to convert variables to factors with labels as levels (default is TRUE).
#' @param ... Additional arguments passed to \code{set_Dict}.
#'
#' @return The modified dataset.
#' @export
#'
#' @examples
#' # Assuming 'my_data' is a data.frame and 'my_dict' is a Dict object
#' factored_data <- with_Dict(my_data, my_dict, use_labels = TRUE)
#' renamed_data <- with_Dict(my_data, my_dict, use_label = TRUE)
with_Dict <- function(tbl, dict = NULL, subset = NULL, use_label = TRUE, use_labels = TRUE, ...) {
  if (!is.null(dict)) {
    tbl <- set_Dict(tbl, dict, subset = subset, ...)
  }
  if (use_labels) {
    if (is.null(subset)) {
      tbl <- sjlabelled::as_label(tbl)
    } else {
      tbl <- tbl |> dplyr::mutate(dplyr::across(dplyr::all_of(subset), sjlabelled::as_label))
    }
  }

  if (use_label) {
    if (is.null(subset)) {
      tbl <- sjlabelled::label_to_colnames(tbl)
    } else {
      .subset <- append(list(tbl), as.list(rlang::syms(subset)))
      tbl <- do.call(sjlabelled::label_to_colnames, .subset)
    }
  }

  return(tbl)
}

#   lbl_df |> set_Dict(lbl_df_dict, label_type = "name") |> dplyr::count(sex) |> with_Dict(subset = "sex")
