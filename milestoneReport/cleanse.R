rm(list = ls())

setwd("C:/Users/Clover/Desktop/DSS_Capstone/final/en_US")
library(RWeka);library(SnowballC);library(tm)


twitter <- readLines("en_US.twitter.txt", encoding="UTF-8")
blogs <- readLines("en_US.blogs.txt", encoding="UTF-8")
news <- readLines("en_US.news.txt", encoding="UTF-8")

set.seed(111)



twitter_sample <- sample(twitter, .02*length(twitter))
fileConn<-file("twitter_sample.txt")
writeLines(twitter_sample, fileConn)
close(fileConn)

blogs_sample <- sample(blogs, .02*length(blogs))
fileConn<-file("blogs_sample.txt")
writeLines(blogs_sample, fileConn)
close(fileConn)

news_sample <- sample(news, .02*length(news))
fileConn<-file("news_sample.txt")
writeLines(news_sample, fileConn)
close(fileConn)

sample.corpus <- c(twitter_sample,blogs_sample,news_sample)
sample.corpus <- c(SampleTwitter, SampleBlog, SampleNews)
#str(sample.corpus)


# Remove numbers
sample.corpus <- tm_map(sample.corpus, removeNumbers)
# Remove punctuations
sample.corpus <- tm_map(sample.corpus, removePunctuation)
# Transform to lower case
sample.corpus <- tm_map(sample.corpus,content_transformer(tolower))
# Remove english common stopwords
sample.corpus <- tm_map(sample.corpus, removeWords, stopwords("english"))
# Remove Emails
email.Path<-function(x) gsub("\\b[A-Z a-z 0-9._ - ]*[@](.*?)[.]{1,3} \\b", "", x)
sample.corpus<- tm_map(sample.corpus, email.Path)
# Remove Twitter tags
twitter.Tags<-function(x) gsub("RT |via", "", x)
sample.corpus<- tm_map(sample.corpus, twitter.Tags)
# Remove Twitter Usernames
twitter.Names<-function(x) gsub("[@][a - zA - Z0 - 9_]{1,15}", "", x)
sample.corpus<- tm_map(sample.corpus, twitter.Names)
# Remove Profanity
noNos <- readLines("noNos.txt", encoding="UTF-8")
sample.corpus <- tm_map(sample.corpus, removeWords, noNos)
# Remove extra white spaces
sample.corpus <- tm_map(sample.corpus, stripWhitespace)

saveRDS(sample.corpus, file = "./SampleCorpus.RData")
