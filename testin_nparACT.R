install.packages('nparACT')
library(nparACT)
biblioPath <- "./Imputados/"
# Lista todos os arquivos no diretório
todos_arquivos <- list.files(biblioPath, full.names = TRUE)

# Filtra os arquivos que começam com "C" seguido de números e "_predicted.txt"
arquivos_filtrados <- grep("^C\\d+_predicted\\.txt$", todos_arquivos, value = TRUE)

for (arquivo in arquivos_filtrados){
  test <- read.table(arquivo, header = TRUE, sep = ";", dec = ",")
  dados <- data.frame(DATE.TIME = test$DATA.TIME,
                      PIM = test$PIM)
  dados$DATE.TIME <- as.POSIXct(dados$DATE.TIME, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
  colnames(dados)[colnames(dados) == "DATE.TIME"] <- "DATE/TIME"
  
  results <- nparACT_base("dados", SR=1/60)
}

file1 <- "./Imputados/C01_predicted.txt"
test <- read.table(file1, header = TRUE, sep = ";", dec = ",")
#dados <- data.frame(DATE.TIME = test$DATE.TIME, 
#                    MS = test$MS,
#                    EVENT = test$EVENT,
#                    TEMPERATURE = test$TEMPERATURE,
#                    EXT.TEMPERATURE = test$EXT.TEMPERATURE,
#                    PIM = test$PIM,
#                    TAT = test$TAT,
#                    TATn = test$TATn,
#                    ZCM = test$ZCM,
#                    ZCMn = test$ZCMn,
#                    LIGHT = test$LIGHT,
#                    AMB.LIGHT = test$AMB.LIGHT,
#                    RED.LIGHT = test$RED.LIGHT,
#                    GREEN.LIGHT = test$GREEN.LIGHT,
#                    BLUE.LIGHT = test$BLUE.LIGHT,
#                    IR.LIGHT = test$IR.LIGHT,
#                    STATE = test$STATE)
dados <- data.frame(DATE.TIME = test$DATE.TIME,
                    PIM  = test$PIM)
dados$DATE.TIME <- as.POSIXct(dados$DATE.TIME, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")


colnames(dados)[colnames(dados) == "DATE.TIME"] <- "DATE/TIME"

r <- nparACT_base("dados", SR=1/60)