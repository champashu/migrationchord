#' Migration Flow Visualisation
#'
#' years :
#'
#' @import htmlwidgets
#'
#' @export
finalchart <- function(message,
                       year = 1995,
                       threshold = 5000,
                       labelThreshold = 5000,
                       animationDuration = 500,
                       maxRegionsOpen = 2,
                       margin = 25,
                       arcPadding = 0.04,
                       infoPopupDelay = 300,
                       arcWidth = 24,
                       width = 800,
                       height = 800,
                       labelPadding = 10,
                       sourcePadding = 3,
                       targetPadding = 20,
                       curveFactor = 0.4,
                       elementId = NULL
                       ) {

  # forward options using x
  x = list ( data = message,
             year = year,
             height = height,
             width = width ,
             arcWidth = arcWidth,
             threshold = threshold,
             animationDuration = animationDuration,
             labelThreshold = labelThreshold,
             maxRegionsOpen = maxRegionsOpen,
             margin = margin,
             infoPopupDelay = infoPopupDelay,
             curveFactor = curveFactor,
             labelPadding = labelPadding,
             sourcePadding = sourcePadding,
             targetPadding = targetPadding,
             arcPadding = arcPadding)

  # create widget
  htmlwidgets::createWidget(
    name = 'finalchart',
    x,
  #  htmlwidgets::sizingPolicy(padding = 0,
   #                           browser.fill = TRUE),
    width = width,
    height = height,
    package = 'finalchart'
  )
}

#' Shiny bindings for finalchart
#'
#' Output and render functions for using finalchart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a finalchart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name finalchart-shiny
#'
#' @export
finalchartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId,'finalchart', width, height, package = 'finalchart')
}

#' @rdname finalchart-shiny
#' @export
renderFinalchart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, finalchartOutput, env, quoted = TRUE)
}
