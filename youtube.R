rm(list = ls())
install.packages('tm')
library(tm)
data1 <- read.csv("INvideos.csv")
data <-  paste(data1$title, collapse = " ")
datasource <- VectorSource(data)
corpus  <- VCorpus(datasource)
##############################################
## Preprocessing
##############################################
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))


dtm <- DocumentTermMatrix(corpus)
dtm2 <-as.matrix(dtm)

freq <- colSums(dtm2)
freq <- sort(freq, decreasing = TRUE)
install.packages('wordcloud')
library(wordcloud)
words <- names(freq)
head(words)
wordcloud(words[1:100],freq[1:100])
