Predict <- function(x) {
  
  cleansed <- removePunctuation(x)
  cleansed <- tolower(cleansed)
  cleansed <- removeNumbers(cleansed)
  cleansed <- str_replace_all(cleansed, "[^[:alnum:]]", " ")
  text <- stripWhitespace(cleansed)
  text <- strsplit(text, " ")[[1]]
  
  
  if (length(text)>= 3) {
    text <- tail(text,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == text[1] & quadgram$bigram == text[2] & quadgram$trigram == text[3], 4],1))){
      Predict(paste(text[2],text[3],sep=" "))
    }
    else {mesg <<- "Model used Quadgram."; head(quadgram[quadgram$unigram == text[1] & quadgram$bigram == text[2] & quadgram$trigram == text[3], 4],1)}
  }
  else if (length(text) == 2){
    text <- tail(text,2)
    if (identical(character(0),head(trigram[trigram$unigram == text[1] & trigram$bigram == text[2], 3],1))) {
      Predict(text[2])
    }
    else {mesg<<- "Model used Trigram."; head(trigram[trigram$unigram == text[1] & trigram$bigram == text[2], 3],1)}
  }
  else if (length(text) == 1){
    text <- tail(text,1)
    if (identical(character(0),head(bigram[bigram$unigram == text[1], 2],1))) {mesg<<-"No match was found. App needs more work!"}
    else {mesg <<- "Model used Bigram."; head(bigram[bigram$unigram == text[1],2],1)}
  }
}