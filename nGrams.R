library(RWeka);library(rJava);library(tm)

final <- readRDS("./SampleCorpus.RData")

# Unigram
unigram <- NGramTokenizer(final, Weka_control(min = 1, max = 1, delimiters = " \\r\\n\\t.,;:\"()?!"))
unigram <- data.frame(table(unigram))
unigram <- unigram[order(unigram$Freq, decreasing = TRUE),][1:10,]
colnames(unigram) <- c("String","Count")
saveRDS(unigram, file = "./unigram.RData")

# Bigram
bigram <- NGramTokenizer(final, Weka_control(min = 2, 
                                             max = 2, delimiters = " \\r\\n\\t.,;:\"()?!"))
bigram <- data.frame(table(bigram))
bigram <- bigram[order(bigram$Freq, decreasing = TRUE),]
colnames(bigram) <- c("String","Count")
saveRDS(bigram, file = "./bigram.RData")

# Trigram
trigram <- NGramTokenizer(final, Weka_control(min = 3, 
                                              max = 3, delimiters = " \\r\\n\\t.,;:\"()?!"))
trigram <- data.frame(table(trigram))
trigram <- trigram[order(trigram$Freq, decreasing = TRUE),]
colnames(trigram) <- c("String","Count")
saveRDS(trigram, file = "./trigram.RData")

# Fourgram

fourgram <- NGramTokenizer(final, Weka_control(min = 4, 
                                               max = 4, delimiters = " \\r\\n\\t.,;:\"()?!"))
fourgram <- data.frame(table(fourgram))
fourgram <- fourgram[order(fourgram$Freq, decreasing = TRUE),]
colnames(fourgram) <- c("String","Count")
saveRDS(fourgram, file = "./fourgram.RData")