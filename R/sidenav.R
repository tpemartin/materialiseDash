sidenav = function(..., side="left", trigger=sidenavTrigger()){
  require(htmltools)
  .sidenavItems = list(...)
  purrr::map(
    .sidenavItems,
    ~{tags$li(.x)}
  ) -> list_sideNavItems
  tagList(
    # Content of sidenav
    {tags$ul(id = "slide-out",
      class = "sidenav",
      # li items
      list_sideNavItems)},
    # Trigger icon of sidenav
    trigger,
    # initialization
    tags$script(
      glue::glue(
        "$(function(){ $('.sidenav').sidenav({edge: '<<side>>'});})",
        .open="<<", .close = ">>")
    )
  ) -> tag_element

  tag_element |>
    attachMaterialiseDep()
}
sidenav_items = function(){
  {tagList(
    {tags$li(tags$div(class = "user-view",
      tags$div(class = "background",
        tags$img(src = "images/office.jpg")),
      tags$a(href = "#user",
        tags$img(class = "circle",
          src = "images/yuna.jpg")),
      tags$a(href = "#name",
        tags$span(class = "white-text name",
          "John Doe")),
      tags$a(href = "#email",
        tags$span(class = "white-text email",
          "jdandturk@gmail.com"))))},
    {tags$li(tags$a(href = "#!",
      tags$i(class = "material-icons",
        "cloud"),
      "First Link With Icon"))},
    {tags$li(tags$a(href = "#!",
      "Second Link"))},
    {tags$li(tags$div(class = "divider"))},
    {tags$li(tags$a(class = "subheader",
      "Subheader"))},
    {tags$li(tags$a(class = "waves-effect",
      href = "#!",
      "Third Link With Waves"))})}
}
sidenavTrigger_boilerplate = function(aTag){
  aTag |> htmltools::tagAppendAttributes(`data-target`="slide-out", class="sidenav-trigger")
}
sidenavTrigger <- function(href="#", class="", .icon=icon("menu")){
  {tags$a(href = href,
    `data-target` = "slide-out",
    class = glue::glue("sidenav-trigger {class}"),
    .icon)}
}
