library(shiny)

shinyServer(  
  function(input, output) {
    output$myPlot <- renderPlot({
      source("data.R")
      if (input$plotData == "ER") {
        title <- "Employment Rate %"
        if (input$school=="All") {
        gp <- ggplot(data = df_total, aes(x=year, y=employment_rate_overall, fill=university))      
      } else {
        dfs <- subset(df_total_school, School == input$school)
        gp <- ggplot(data = dfs, aes(x=year, y=employment_rate_overall, fill=university))      
      }
        gp <- gp + scale_y_continuous(name="Employment Rate" )
        gp <- gp + geom_bar(stat="identity", position=position_dodge())
        gp <- gp + geom_text(aes(label=employment_rate_overall),  position = position_dodge(0.9))
      } else {
        title <- "Gross Monthly Salary"
        if (input$school=="All") {
          gp <- ggplot(data = df_total, aes(x=year, y=gross_monthly_mean, fill=university))      
        } else {
          dfs <- subset(df_total_school, School == input$school)
          gp <- ggplot(data = dfs, aes(x=year, y=gross_monthly_mean, fill=university))      
        } 
        gp <- gp + scale_y_continuous(name="Gross Monthly (SGD)",limits=c(0, 5000) )
        gp <- gp + geom_bar(stat="identity", position=position_dodge())
        gp <- gp + geom_text(aes(label=gross_monthly_mean),  position = position_dodge(0.9))
      }
      gp <- gp + labs(title = paste(title,"(" ,input$school,")")) +  scale_fill_brewer(palette="Set1")
      gp
    })      
    }
)