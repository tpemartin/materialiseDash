footer = function(.content=NULL, .copyright=NULL, sticky=T){
  if(is.null(.content) && is.null(.copyright)) return(NULL)
  require(htmltools)
  tagList(
    tags$footer(class = "page-footer",
      .content,
      tags$div(class = "footer-copyright",
        .copyright))
  ) -> tag_element

  if(sticky){
    tag_element = tagList(
      tag_element,
      tags$style("body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  main {
    flex: 1 0 auto;
  }")
    )
  }
  tag_element |> attachMaterialiseDep()
}

footer_content <- function(){tags$div(class = "container",
  tags$div(class = "row",
    tags$div(class = "col l6 s12",
      tags$h5(class = "white-text",
        "Footer Content"),
      tags$p(class = "grey-text text-lighten-4",
        "You can use rows and columns here to organize your footer content.")),
    tags$div(class = "col l4 offset-l2 s12",
      tags$h5(class = "white-text",
        "Links"),
      tags$ul(tags$li(tags$a(class = "grey-text text-lighten-3",
        href = "#!",
        "Link 1")),
        tags$li(tags$a(class = "grey-text text-lighten-3",
          href = "#!",
          "Link 2")),
        tags$li(tags$a(class = "grey-text text-lighten-3",
          href = "#!",
          "Link 3")),
        tags$li(tags$a(class = "grey-text text-lighten-3",
          href = "#!",
          "Link 4"))))))}
footer_copyright <- function(){tags$div(class = "container",
  "© 2014 Copyright Text",
  tags$a(class = "grey-text text-lighten-4 right",
    href = "#!",
    "More Links"))}
