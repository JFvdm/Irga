setwd("C:/Users/Dell/Documents/Repositories/Speel/amy")

unraw <- function(file){
        con <- file(file, open = "rt", raw = T)
        text <- readLines(con, skipNul = T)
        close(con)
        
        text <- text[11:length(text)]
        text <- text[-2]
        
        text <- text[- grep("Remark", text)]
        text <- text[- grep("\"", text)]
        
        text <- strsplit(text, split =",")
        text <- data.frame(matrix(unlist(text), nrow = length(text), byrow = T), stringsAsFactors = F)
        text[1,] <- as.character(text[1,])
        colnames(text) <- text[1, ]
        text <- text[-1,]
        text
}

plotcurve <- function()