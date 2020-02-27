library("shiny")

intro_panel <- tabPanel(
  title = "Introduction",
  titlePanel("Income Inequality"),
  p("The below diagram was created by the New York Times to illustrate the..."),
  img(src = "inequality.png", alt = "Example NYT chart"),
  p(a(href = "https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html"),
  "(source)"),
)

sidebar_content <- sidebarPanel(
  sliderInput(inputId = "percentile", label = "Income Percentile", min = 0, max = 100, value = c(0, 100))
  
)

main_content <- mainPanel(
  plotOutput(ouputId = "plot"),
  p("Data from", a(href = "http://gabriel-zucman.eu/usdina/", "http://gabriel-zucman.eu/usdina/"))
)

growth_panel <- tabPanel(
  title = "Growth Chart",
  titlePanel("Income Growth 1980-2014"),
  sidebarLayout(
    sidebar_content,
    main_content
  )
)

ui <- navbarPage(
  title = "Income Inequality",
  intro_panel,
  growth_panel
)



