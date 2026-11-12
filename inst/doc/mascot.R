## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
site_url <- "https://insightsurge.github.io/mascot/"
library(mascot) # nolint: undesirable_function_linter.

## ----install, eval=FALSE------------------------------------------------------
# install.packages("mascot")

## ----install-dev, eval=FALSE--------------------------------------------------
# # install.packages("pak")
# pak::pak("insightsurge/mascot")

## ----studio-start, eval=FALSE-------------------------------------------------
# mascot_studio()
# mascot_studio(view = "theme")

## ----first-app, eval=FALSE----------------------------------------------------
# library(shiny)
# library(mascot)
# 
# ui <- fluidPage(
#   h1("Batch review"),
#   actionButton("finish", "Finish review"),
#   mascot("helper", status = "Ready to review")
# )
# 
# server <- function(input, output, session) {
#   observeEvent(input$finish, {
#     update_mascot(
#       "helper",
#       mood = "happy",
#       status = "Review complete",
#       bubble = mascot_bubble("All rows checked.", duration = 5)
#     )
#   })
# }
# 
# shinyApp(ui, server)

## ----open-example-list--------------------------------------------------------
mascot_examples()

## ----open-example-run, eval=FALSE---------------------------------------------
# mascot_example("form-check")
# mascot_studio()

## ----moods-and-characters-----------------------------------------------------
mascot_characters()
mascot_moods("tessa")

## ----mood-status-update, eval=FALSE-------------------------------------------
# update_mascot("helper", mood = "worried", status = "2 fields need attention")
# update_mascot("helper", mood = "happy", status = mascot_status())

## ----bubbles-helpers, results="hide"------------------------------------------
mascot_bubble("Three rows skipped.")
mascot_bubble("Check the dates in column B.", duration = Inf)
mascot_bubble()

## ----bubbles-update, eval=FALSE-----------------------------------------------
# update_mascot(
#   "helper",
#   mood = "worried",
#   status = "Import needs attention",
#   bubble = mascot_bubble("Check the dates in column B.", duration = Inf)
# )

## ----gestures-listing---------------------------------------------------------
mascot_gestures("tessa")

## ----gesture-update, eval=FALSE-----------------------------------------------
# update_mascot("helper", gesture = mascot_gesture("nod"))

## ----size-placement-helpers, results="hide"-----------------------------------
mascot_size(180, small_screen = 72)
mascot_placement("bottom-right", minimise = TRUE, drag = "snap")

## ----size-placement-app, eval=FALSE-------------------------------------------
# mascot("card_helper", size = 120, placement = "inline")
# mascot("corner_helper", placement = mascot_placement("bottom-right", drag = "snap"))
# update_mascot("corner_helper", placement = mascot_placement("top-left"))

## ----palettes-and-roles-------------------------------------------------------
mascot_palettes("tessa")

## ----theme-examples, eval=FALSE-----------------------------------------------
# pink_theme <- mascot_theme(
#   light = list(body = "#B53D78", rim = "#A94A82"),
#   dark = list(body = "#F2A6CF", rim = "#C5B0EB")
# )
# 
# mascot("helper", theme = pink_theme)
# update_mascot("helper", theme = "coral_navy")

## ----motion-helpers, results="hide"-------------------------------------------
mascot_motion_settings(idle = FALSE)
mascot_motion_settings(others = FALSE, gestures = TRUE)

## ----motion-app, eval=FALSE---------------------------------------------------
# mascot("still_helper", motion = FALSE)
# update_mascot("still_helper", motion = mascot_motion_settings(idle = FALSE))

## ----clicks-and-menus, eval=FALSE---------------------------------------------
# mascot(
#   "helper",
#   click = mascot_popup_menu(c(finish = "Finish review", reset = "Reset helper"))
# )
# 
# observeEvent(input$helper_menu, {
#   if (identical(input$helper_menu, "finish")) {
#     update_mascot(
#       "helper",
#       mood = "happy",
#       status = "Review complete",
#       bubble = mascot_bubble("All checks finished.", duration = Inf),
#       gesture = mascot_gesture("nod")
#     )
#   }
# })

## ----shiny-module, eval=FALSE-------------------------------------------------
# review_ui <- function(id) {
#   ns <- shiny::NS(id)
#   shiny::tagList(
#     shiny::actionButton(ns("finish"), "Finish review"),
#     mascot(ns("helper"), placement = "inline")
#   )
# }
# 
# review_server <- function(id) {
#   shiny::moduleServer(id, function(input, output, session) {
#     shiny::observeEvent(input$finish, {
#       update_mascot("helper", mood = "happy", status = "Review complete")
#     })
#   })
# }

## ----preview-and-studio, eval=FALSE-------------------------------------------
# page <- mascot_preview(
#   theme = mascot_theme(
#     light = list(body = "#B53D78", rim = "#A94A82"),
#     dark = list(body = "#F2A6CF", rim = "#C5B0EB")
#   )
# )
# attr(page, "contrast")
# 
# mascot_studio(view = "theme")

## ----reset-examples, eval=FALSE-----------------------------------------------
# # Change only the mood; status, bubble and theme stay as they were:
# update_mascot("helper", mood = "thinking")
# 
# # Reset custom status, clear the bubble, and restore original colours:
# update_mascot(
#   "helper",
#   status = mascot_status(),
#   bubble = mascot_bubble(),
#   theme = mascot_theme()
# )

