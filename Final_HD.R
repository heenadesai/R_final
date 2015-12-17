
rm(list=ls())
graphics.off()

path_to_R_libraries <- "/Users/hdesai/Documents/R_packages/"
setwd("/Users/hdesai/Documents/Fall2015/MachineLearning/Final/")

# Original Columns A-F were removed in Excel
data_file <- read.csv("/Users/hdesai/Documents/Fall2015/MachineLearning/Final/ST000003_peaks_table.csv", header = TRUE, sep =",")

#complete.cases removes rows with NAs values
comp_data <- data_file[complete.cases(data_file),]
is.matrix(comp_data) #checks to see if matrix true or false <--- this results in false
View(comp_data)

# Create a matrix 
data_mat <- as.matrix(comp_data)
is.matrix(data_mat) #checks to see if matrix is true or false <--- this results in true
View(data_mat)

#summary(data_mat)


#Normalization- mean centering ---- Taken from classification.R code
norm_funct <- function(x) {
  y <- (x - min(x)) / (max(x) - min(x))
  return(y)
}
norm_data <- as.data.frame(lapply(data_mat[,2:19], norm_funct) )
View(norm_data)
summary(norm_data)
