#' Create Example object
#'
#' @slot type character
#' @slot expr_filename character
#' @slot label_filename character
setClass(
  "Example",
  slots = c(
    type = "character",
    expr_filename = "character",
    label_filename = "character"
  )
)


setMethod(
  f = "show",
  signature = "Example",
  definition = function(object) {
    cat(format("Print Example object"), "\n")
  }
)
