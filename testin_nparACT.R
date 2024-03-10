install.packages('nparACT')
library(nparACT)

# Running for imputed values
biblioPath <- "./Imputados/"

all_files <- list.files(biblioPath, full.names = TRUE)

result_df <- data.frame(matrix(ncol = 7, nrow = 0))

for (file in all_files){
  test <- read.table(file, header = TRUE, sep = ";", dec = ",")
  df <- data.frame(DATE.TIME = test$DATE.TIME,
                      PIM = test$PIM)
  df$DATE.TIME <- as.POSIXct(df$DATE.TIME, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
  colnames(df)[colnames(df) == "DATE.TIME"] <- "DATE/TIME"
  
  results <- nparACT_base("df", SR=1/60)
  result_df <- rbind(result_df, results)
}
write.csv(result_df, "imputed_results.csv")

# Running for original values
originalPath <- "./Originais/"
original_files <- list.files(originPath, full.names = TRUE)

original_result_df <- data.frame(matrix(ncol = 7, nrow = 0))

for (file in original_files) {
  txt_file <- read.table(file, header = TRUE, sep = ";", dec = ",")
  df <- data.frame(DATE.TIME = txt_file$DATE.TIME,
                   PIM = txt_file$PIM)
  df$DATE.TIME <- as.POSIXct(df$DATE.TIME, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
  
  results <- nparACT_base("df", SR=1/60)
  
  original_result_df <- rbind(original_result_df, results)
}
write.csv(original_result_df, "original_results.csv")