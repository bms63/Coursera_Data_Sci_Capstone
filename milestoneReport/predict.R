library(stylo);library(stringr);library(tm)

bigram <- readRDS(file="./bigram.RData")
trigram <- readRDS(file="./trigram.RData")
fourgram <- readRDS(file="./fourgram.RData")

cleanText <-function(text){
  
  cleansed <- removePunctuation(text)
  cleansed <- tolower(cleansed)
  cleansed <- removeNumbers(cleansed)
  cleansed <- str_replace_all(cleansed, "[^[:alnum:]]", " ")
  text <- stripWhitespace(cleansed)
  return(text)
}

wordPredict <- function(text){
  textInput <- cleanText(text)
  text <- unlist(strsplit(text,' '))
  
    if (length(text)==1){
      true <- grepl(textInput, bigram$String)
      value<- min(which(true == TRUE))
      value_2 <- as.character(bigram[["String"]][value])
      value_3 <- unlist(strsplit(value_2,' '))
      print(value_3[2])
    }

    text <- unlist(strsplit(text,' '))
      
    if (length(text)==2){
      true <- grepl(textInput, trigram$String)
      value<- min(which(true == TRUE))
      value_2 <- as.character(trigram[["String"]][value])
      value_3 <- unlist(strsplit(value_2,' '))
    print(value_3[3])
    }

    text <- unlist(strsplit(text,' '))
    
    if (length(text)==3){
      true <- grepl(textInput, fourgram$String)
      value<- min(which(true == TRUE))
      value_2 <- as.character(fourgram[["String"]][value])
      value_3 <- unlist(strsplit(value_2,' '))
      print(value_3[4])
    }
  }

wordPredict("martin luther king")
wordPredict("dont")
wordPredict("New y/ork")
wordPredict("cant")



