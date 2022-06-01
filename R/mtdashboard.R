attachMaterialiseDep <- function(tag){
  deps = econWeb::Dependency()
  append(deps$all(),
    list(htmltools::htmlDependency(
      name="materialise-dash", version="0.0.1",
      src=c(file=system.file("materialise-dash/", package="materialiseDash")),
      stylesheet = "css/style.css"
    ))
  ) -> list_deps
  htmltools::attachDependencies(
    tag, list_deps
  )
}
obtain_css = function(){
  system.file("materialise-dash/css/style.scss", package="materialiseDash") -> sassfile
  sass::sass(sass::sass_file(sassfile))

}
div_widget = function(...){
  require(htmltools)
  div(
    style=css("position"="relative"),
    ...
  )
}
navItem = function(
    href = "sass.html",
    content="Sass"
){
  tags$li(tags$a(href = href,
    content))
}
nav <- function(
  title="Logo", ...
  ){
  require(htmltools)
    tags$nav(tags$div(class = "nav-wrapper",
      tags$a(href = "#",
        class = "brand-logo center",
        title),
      tags$ul(id = "nav-mobile",
        class = "left hide-on-med-and-down",
        ...)))-> tag_element

  tag_element |> attachMaterialiseDep()
}




test = function() sidenav() |> econIDV::showWidget()
icon = function(name, class=""){
  require(htmltools)
  tags$i(
    class=glue::glue("material-icons {class}"), name) |>
      attachMaterialiseDep()
}
