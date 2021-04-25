library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(dlookr)
library(rtweet)
library(twitteR)
library(tm)
library(qdapRegex)

rm(list=ls())
df <- read.csv("./Analysing-Trump-Tweets.csv")
df_url <- rm_url(df)

tweet <- df$content




## RTWeet Package
tweets <- search_tweets("#POTUS45",n=200,include_rts = FALSE)
tweets$Ymd <- as.Date(tweets$created_at)
