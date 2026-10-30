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


# Create a new dataset from the original student data
performance2 <- performance

# Identify the subject columns
subjects <- c(
  "Mathematics",
  "English",
  "Biology",
  "Computer_Studies"
)

# Calculate each student's average mark
performance2$Total_Average <- rowMeans(
  performance2[, subjects, drop = FALSE],
  na.rm = TRUE
)

# Assign Pass or Fail
performance2$Decision <- ifelse(
  performance2$Total_Average >= 60,
  "Pass",
  "Fail"
)

# Display the new dataset
head(performance2, 10)

# Count pass and fail
table(performance2$Decision)

