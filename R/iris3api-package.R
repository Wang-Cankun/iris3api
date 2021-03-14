#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
#' @importFrom tibble tibble
## usethis namespace: end
NULL

#' Hello world function
#'
#' This function sends hello message from a given name.
#'
#' @param name echo name
#'
#' @return A string
#' @export
hello_name <- function(name) {
  result <- as.character(stringr::str_glue("Hello, {name}"))
  message(result)
  return(result)
}


#' DEV tool: auto style and lint package
#'
#' @return NULL
#' @export
#'
style_and_lint <- function() {
  styler::style_pkg()
  lintr::lint_package()
}
