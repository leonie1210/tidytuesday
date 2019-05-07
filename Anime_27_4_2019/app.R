#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages("DT")

library(shiny)
library(tidyverse)
library(DT)

#write_rds(anime, "temp.rds")
anime <- read_rds(here::here("Anime_27_4_2019", "temp.rds"))

# tidy_anime <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-23/tidy_anime.csv")
# anime <- tidy_anime %>% select(animeID, name, source, genre, type, episodes, rating, score, scored_by, rank, popularity) %>% 
#   mutate(source = factor(source))

# anime$source
# Input

ui <- fluidPage(
  
  titlePanel("Data Anime"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxInput("web", "Web manga", FALSE),
      checkboxInput("vis", "Visual novel", FALSE),
      checkboxInput("unknown", "Unknown", FALSE),
      checkboxInput("radio", "Radio", FALSE),
      checkboxInput("pb", "Picture Book", FALSE),
      checkboxInput("other", "Other", FALSE),
      checkboxInput("original", "Orginial", FALSE),
      checkboxInput("novel", "Novel", FALSE),
      checkboxInput("music", "Musik", FALSE),
      checkboxInput("manga", "Manga", FALSE),
      checkboxInput("ln", "Light Novel", FALSE),
      checkboxInput("game", "Game", FALSE),
      checkboxInput("dm", "Digital Manga", FALSE),
      checkboxInput("cg", "Card Game", FALSE),
      checkboxInput("book", "Book", FALSE),
      checkboxInput("koma", "4-koma manga", FALSE)
    ),
    
    mainPanel(
      plotOutput("sourceplot"),
      DT::DTOutput("tabledata")
    )
  )
)

#Output

server <- function(input, output) {
  output$sourceplot <- renderPlot({
    temp <- anime %>% filter(source == "gjhcghvbk")
    
    if(input$web){
      anime %>% filter(source == "Web manga") %>% bind_rows(temp) -> temp
    }
    if(input$vis){
      anime %>% filter(source == "Visual novel") %>% bind_rows(temp) -> temp
    }
    if(input$unknown) {
      anime %>% filter(source == "Unknown") %>% bind_rows(temp) -> temp
    }
    if(input$radio) {
      anime %>% filter(source == "Radio") %>% bind_rows(temp) -> temp
    }
    if(input$pb) {
      anime %>% filter(source == "Picture Book") %>% bind_rows(temp) -> temp
    }
    if(input$other) {
      anime %>% filter(source == "Other") %>% bind_rows(temp) -> temp
    }
    if(input$original) {
      anime %>% filter (source == "Original") %>% bind_rows(temp) -> temp
    }
    if(input$novel) {
      anime %>% filter(source == "Novel") %>% bind_rows(temp) -> temp
    }
    if(input$music) {
      anime %>% filter(source == "Musik") %>% bind_rows(temp) -> temp
    }
    if(input$manga) {
      anime %>% filter(source == "Manga") %>% bind_rows(temp) -> temp
    }
    if(input$ln) {
      anime %>% filter(source == "Light Novel") %>% bind_rows(temp) -> temp
    }
    if(input$game) {
      anime %>% filter(source == "Game") %>% bind_rows(temp) -> temp
    }
    if(input$dm) {
      anime %>% filter(source == "Digital Manga") %>% bind_rows(temp) -> temp
    }
    if(input$cg) {
      anime %>% filter(source == "Card Game") %>% bind_rows(temp) -> temp
    }
    if(input$book) {
      anime %>% filter(source == "Book") %>% bind_rows(temp) -> temp
    }
    if(input$koma) {
      anime %>% filter(source == "4-koma manga") %>% bind_rows(temp) -> temp
    }
      
    temp %>% ggplot() +
      aes(x = source, y = rank) +
      geom_boxplot(fill = "white", colour = "blue") + coord_flip() +
      labs(title = "Die meisten Serien auf der 'myAnimelist' stammen von Bild-Büchern",
           x = "Ursprung der Serie",
           y = "Rang auf der 'myAnimelist'",
           subtitle = "Boxplot der Ränge auf der 'myAnimelist' sortiert nach dem Ursprung der Serien",
           caption = "Punkte sind Ausreißer") +
      theme_grey()
  })
  output$tabledata <- renderDT(anime)
}

shinyApp(ui = ui, server = server)
