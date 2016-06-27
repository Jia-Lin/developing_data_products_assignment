shinyUI(pageWithSidebar(  
  headerPanel("Singapore University Graduate Employment Survey"),  
  sidebarPanel(    
    radioButtons("plotData", NULL, c("Employment Rate" = "ER", "Gross Monthly" = "GM")),
    selectInput("school", "Type of School", 
                c("All" = "All", 
                  "Business" = "Business",
                  "Engineering" = "Engineering",
                  "Humanities" = "Humanities",
                  "Science" = "Science",
                  "Education" = "Education",
                  "Information Technology" = "Information Technology",
                  "Dentistry" = "Dentistry",
                  "Environment" = "Environment",
                  "Law" = "Law",
                  "Medicine" = "Medicine",
                  "Accounting" = "Accounting",
                  "Technology" = "Technology")
                ),
    helpText("Select employment rate or gross monthly to view employment rate or monthly salary by university. 
             Type of school can also be selected."),
    HTML("<br>Application source is available at <a href='https://github.com/Jia-Lin/developing_data_products_assignment.git'>GitHub</a>"),
    HTML("<br><strong>Disclaimer:</strong><br> The orginal data is downloaded from <a href='https://data.gov.sg/dataset/graduate-employment-survey-ntu-nus-sit-smu-sutd'>data.gov.sg</a>. <br>
             Type of school were added manually after downloading. 
<br>Any analysis or transformation of data are made by myself and shall not be attributed to the Singapore Government or its Statutory Boards;
<br>The datasets provided by the Singapore Government and its Statutory Boards via Data.gov.sg are governed by the Terms of Use available at <a href='https://data.gov.sg/terms'>https://data.gov.sg/terms</a>. 
To the fullest extent permitted by law, the Singapore Government and its Statutory Boards are not liable for any damage or loss of any kind caused directly or indirectly 
by the use of the datasets or any derived analyses or applications.")
  ),         
  mainPanel(    
    plotOutput('myPlot')  
  )
)) 