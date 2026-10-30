title: "Home work"
author: "Fiston Niyigena"
date: "`r Sys.Date()`"
output:
  html_document: default
pdf_document: default


## HW1: Import data from statistical package and from database management system
# for removing hash tag in the table before number
knitr::opts_chunk$set(comment = NA)


library(openxlsx)

performance <- read.xlsx(
  "D:/DOC/COURSES/BIG DATA ANALYTICS/Rfor date science/Home work/student_list.xlsx"
)

# Check dataset structure and column names
str(performance)
names(performance)

# Summary statistics for the dataset
summary(performance)

# Display the first and last five rows
head(performance, 5)
tail(performance, 5)

# Display variable names
variable.names(performance)

names(performance)
View(performance)


# Identify numeric columns
#The name of the new dataset being created
numeric_data <- performance[ , sapply(performance, is.numeric), drop = FALSE]

# Calculate mean and standard deviation
performance1 <- data.frame(
  Subject = names(numeric_data),
  Mean = sapply(numeric_data, mean, na.rm = TRUE),
  SD = sapply(numeric_data, sd, na.rm = TRUE)
)

print(performance1)
