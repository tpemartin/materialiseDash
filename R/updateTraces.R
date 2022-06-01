customInteraction = readRDS("/Users/martinl/Github/interactive-data-visualization/bookdown/data/customInteraction.Rds")
customInteraction$load$sf_electionsByYears()
customInteraction$load$label_share()
customInteraction$load$twoPartyPals()
library(ggplot2)
library(plotly)
plot_election = function(sf) {
  sf |> plotly::plot_ly(height=600) |>
    add_sf(
      # legendgroup=~地區,
      name=~地區,
      color=~勝黨得票率區間2,
      colors=twoPartyPals,
      alpha=1,
      line=list(color="#fafafa", width=0.3)
    ) |>
    layout(showlegend=F)
}
sf_electionsByYears[[3]] |>
  plot_election() -> pltOld
sf_electionsByYears[[2]] |>
  plot_election() -> pltNew

# obtain the traces that have changed and their changed parts. Traces between plotOld and plotNew are identified through their data "name" column.
pltOld |>
  econIDV::get_restyleInfo(pltNew, traceId="name") ->
  restyleInfo

