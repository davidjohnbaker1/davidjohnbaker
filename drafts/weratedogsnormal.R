2 +2

library(data.table)
library(twitteR)
library(stringr)


consumer_key <- 'AgcogpDB1piKIE3PMy4k1ZcZZ'
consumer_secret <- '94PsgwnIsz3VGw7PtUWUtpsjgeeyFWEynz57ZyEjRfVODMifTS'
access_token <- '152352020-wumlA1GIj75Hzr70CcCT3aEC1RgOCU3e4htv8CdL'
access_secret <- 'a8MuiufSB2ekHpEgaZtcNjRQf38T34mcE15ubS87bAA2O'

setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)

dog.rates <- twitteR::searchTwitteR('from:dog_rates',n = 500)
dog.df <- twitteR::twListToDF(dog.rates)

dog.dt <- data.table(dog.df)

rating.index <- str_detect(string = dog.dt$text,pattern = "[0-9][0-9]/10")

rated <- dog.dt[rating.index]

ratings <- str_replace_all(string = rated$text, pattern = "/10",replacement = "" )
ratings.2 <- unlist(str_extract_all(string = ratings, pattern = "\ [0-9][0-9]"))

numbers <- as.numeric(ratings.2)
hist(scale(numbers))
