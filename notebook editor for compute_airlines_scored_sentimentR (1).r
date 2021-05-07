
library(dataiku)
#library(sentimentr)
library(SentimentAnalysis)
library(dplyr)
library(tm)



# Recipe inputs
df <- dkuReadDataset("airline_tweets_unique", samplingMethod="head", nbRows=100000)


#Score with sentimentR
#df$sentimentR_polarity <- sentiment(df$text)$sentiment

#df <- cbind(df, sentiment[,4])


#Score with sentimentAnalyzer and take the mean



head(df)

corp <- Corpus(VectorSource(df$text_processed))
du <- analyzeSentiment(corp)






du[du == 0] <- NA
du <- mutate(du, mean_sentiment = rowMeans(select(du, starts_with("Sentiment")), na.rm=T))

df$sentimentA_polarity <- du$mean_sentiment


dg <- df$text_processed[1:100]

dg

dg[dg == 0] <- NA
dc = analyzeSentiment(dg)

dc[dc == 0] <- NA
du <- mutate(dc, mean_sentiment = rowMeans(select(dc, starts_with("Sentiment")), na.rm=T))
sentiment <- du$mean_sentiment
df <- cbind(df, sentiment)
summary(df)

library(sentimentr)
dim(df)

dg <- get_sentences(df$text_processed)
df$sentiment <- sentiment(dg)$sentiment


summary(df)

dg <- df[1:100000,]
corpus <- get_sentences(dg$text_processed)
dg$sentiment <- sentiment(corpus)$sentiment
summary(dg)

dg <- df[1:100000,]
corpus <- get_sentences(dg$text_processed)
sentiment <- sentiment(corpus)
dg <- cbind(dg, sentiment$sentiment)
summary(dg)
