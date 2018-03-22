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


for(i in c("don't", "last", "can''t")){

textInput <- cleanText(i)
true <- grepl(textInput, bigram$String)
value<- min(which(true == TRUE))
value_2 <- as.character(bigram[["String"]][value])
value_3 <- unlist(strsplit(value_2,' '))
print(value_3[2])
}

sentence <- "im"
length(sentence)
unlist(strsplit(sentence,' '))


bigram(sentence[length(sentence)])

nextWord <- function(textInput){
  wordPrediction <- as.character(bigram[bigram$unigram==textInput[3],][1,]$bigram)
  }



nextWordPrediction <- function(wordCount,textInput){
  
  if (wordCount>=3) {
    textInput <- textInput[(wordCount-2):wordCount] 
    
  }
  
  else if(wordCount==2) {
    textInput <- c(NA,textInput)   
  }
  
  else {
    textInput <- c(NA,NA,textInput)
  }
  
  
  ### 1 ###
  wordPrediction <- as.character(fourgram[fourgram$unigram==textInput[1] & 
                                            fourgram$bigram==textInput[2] & 
                                            fourgram$trigram==textInput[3],][1,]$quadgram)
  
  if(is.na(wordPrediction)) {
    wordPrediction1 <- as.character(trigram[trigram$unigram==textInput[2] & 
                                              trigram$bigram==textInput[3],][1,]$trigram)
    
    if(is.na(wordPrediction)) {
      wordPrediction <- as.character(bigram[bigram$unigram==textInput[3],][1,]$bigram)
    }
  }
  
  
  print(wordPrediction)
  
}

nextWordPrediction(3, "right")
