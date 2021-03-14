#' Data of yan_2013
#'
#' Yan 2013: Human embryo, 7 cell types, 90 cells
#'
#' @format A list with expression matrix and metadata:
#'
#' $meta:
#' \describe{
#'   \item{$expr}{a data frame with 20214 genes (rows) amd 90 cells (columns)}
#'   \item{$meta$Cluster}{fct cell type}
#' }
#' @source \url{https://www.nature.com/articles/nsmb.2660}
"yan_2013"

#' Data of zeisel_2015
#'
#' Zeisel 2015: Mouse Brain, 7 cell types, 3005 cells
#'
#' @format A list with expression matrix and metadata:
#' #'\describe{
#'   \item{$expr}{a data frame with 19972 genes (rows) amd 3005 cells (columns)}
#'   \item{$meta$Label}{fct cell type}
#'   \item{$meta$Sex}{fct random generated sex info}
#'   \item{$meta$Sample}{fct random generated sample info}
#' }
#' @source \url{https://science.sciencemag.org/content/347/6226/1138.abstract}
"zeisel_2015"
