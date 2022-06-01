button = function(content=NULL, class=""){
  tags$a(class=glue::glue("waves-effect waves-light btn {class}"), content) |>
    attachMaterialiseDep()
}
button_float = function(.icon, ..., class=""){
  require(htmltools)
  tags$a(
    class=glue::glue("btn-floating btn-large waves-effect waves-light {class}"),.icon, ...) |>
    attachMaterialiseDep()
}
button_float_action = function(..., float_btn=float_btn_fn()){
  argList = list(...)
  if(length(argList)==1 && is.list(argList[[1]])) argList = argList[[1]]
  require(htmltools)
  if(length(argList)==0){
    list_actions=NULL
  } else
  if(!("action list" %in% class(argList))){
    purrr::map(argList,
      ~{
        .x |> htmltools::tagAppendAttributes(class="btn-floating") -> .x
        tags$li(.x)
        }) -> list_actions
  } else {
    argList -> list_actions
  }

  tagList(
    tags$div(class = "fixed-action-btn",
      float_btn,
      tags$ul(class="ul-float",
        # li of actions
        list_actions)),
    tags$script("
      $(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();
  });")
  ) -> tag_element

  tag_element |> attachMaterialiseDep()
}

list_actions_fun = function(){
  tagList(tags$a(class = "btn-floating btn-flat red",
    "2001"),
    tags$a(class = "btn-floating yellow darken-1",
      tags$i(class = "material-icons",
        "format_quote")),
    tags$a(class = "btn-floating green",
      tags$i(class = "material-icons",
        "publish")),
    tags$a(class = "btn-floating blue",
      tags$i(class = "material-icons",
        "attach_file")))
}

actionMenu <- function(..., title=""){
  require(htmltools)
  argList = list(...)
  purrr::map(
    argList,
    ~{
      tags$li(tags$a(class="menu-item btn-floating white", .x))
    }
  ) -> list_actions

  if(title!=""){
    append(list(
      tags$li(tags$a(class="btn-floating btn-flat menu-title white", tags$h6(style=css("margin"=0), title)))), list_actions) -> list_actions
  }
  class(list_actions) <- c("list", "action list")
  list_actions
}
float_btn_fn <- function(){
  button_float(icon("menu", class="grey-text"), class="right white")
}
test2 <- function(){
  actionMenu(title="大選年份", "2012", "2016", "2020") |>
    button_float_action() |>
    econIDV::showWidget()
}


