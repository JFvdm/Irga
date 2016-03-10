##Requires ggplot2


unraw <- function(file, type = "csv", save = FALSE){
        
        #check arguments
        if(!type %in% c("csv", "xls")){stop("Argument type not recognised, must be either \"csv\" or \"xls\"")}
        
        if(type == "csv"){
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
        
        #if(type == "xls"){
        #        data  = read.xlsx(file, sheetIndex = 1, header = TRUE, startRow = 1)
        #        
        #}
        
        
        
}



plotcurve <- function(data, curve = "light"){
        
        #check arguments
        if(!curve %in% c("light", "aci")){stop("curve must be ether \"light\" or \"aci\"")}
                
                
        if(curve == "light"){
                data$PARi <- as.numeric(data$PARi)
                data$Photo <- as.numeric(data$Photo)
                
                plot <- ggplot(data, aes(data$PARi, data$Photo)) + stat_smooth()
        }
        
        if(curve == "aci"){
                
        }
        
        plot
}







