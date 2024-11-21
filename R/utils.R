#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL

#' Example Labeled Dataset
#'
#' A simple data frame with two variables: sex and age.
#'
#' @format A data frame with 100 rows and 2 variables:
#' \describe{
#'   \item{sex}{Numeric, representing sex (1 = Male, 2 = Female).}
#'   \item{age}{Numeric, representing age.}
#' }
#' @source Simulated data.
"lbl_df"

#' Example Data Dictionary for lbl_df
#'
#' A Dict object defining the data dictionary for the `lbl_df` dataset.
#'
#' @format A Dict object with the following variable definitions:
#' \describe{
#'   \item{sex}{
#'     \itemize{
#'       \item label: "Sex || What is your sex?"
#'       \item labels: c("Male" = 1, "Female" = 2)
#'     }
#'   }
#'   \item{age}{
#'     \itemize{
#'       \item label: "Age || How old are you?"
#'       \item dtype: "integer"
#'     }
#'   }
#' }
#' @source Simulated data.
"lbl_df_dict"