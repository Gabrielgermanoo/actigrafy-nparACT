install.packages('nparACT')
library(nparACT)
file1 <- "./Imputados/C01_predicted.txt"
test <- read.table(file1, header = TRUE, sep = ";", dec = ",")
dados <- data.frame(DATE.TIME = test$DATE.TIME, 
                    MS = test$MS,
                    EVENT = test$EVENT,
                    TEMPERATURE = test$TEMPERATURE,
                    EXT.TEMPERATURE = test$EXT.TEMPERATURE,
                    PIM = test$PIM,
                    TAT = test$TAT,
                    TATn = test$TATn,
                    ZCM = test$ZCM,
                    ZCMn = test$ZCMn,
                    LIGHT = test$LIGHT,
                    AMB.LIGHT = test$AMB.LIGHT,
                    RED.LIGHT = test$RED.LIGHT,
                    GREEN.LIGHT = test$GREEN.LIGHT,
                    BLUE.LIGHT = test$BLUE.LIGHT,
                    IR.LIGHT = test$IR.LIGHT,
                    STATE = test$STATE)
r <- nparACT_base(dados, SR=1/60)
