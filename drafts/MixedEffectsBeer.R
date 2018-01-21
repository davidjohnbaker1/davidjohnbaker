# Beer Mixed Effects Analysis 

# Script for Running a Mixed Effects Analsyis 

library(ggplot2)
library(data.table)
beer <- fread("../content/post/data/beer_reviews.csv") 

# Wrote a post with basic linear models, was about to publish, models were bad.
# Gotta pick the right model
# That model is one that takes into account noise from participants and individual beers, have enough data.
# Need to make sure each kind of beer has well over enough ratings
# Not exactly sure approriateness of Mixed models so going to play it safe ??

# Need to get the "good" data out of this
beer[, beer_name_unique := paste(brewery_name,beer_name, beer_style)]

names(beer)

# Beers that have over 30 reviews
quality.beers <- beer[, .(TimesBeerReviewed = .N), by = beer_name_unique][order(-TimesBeerReviewed)][TimesBeerReviewed >= 30]

# Beer Types that are heavily represented in beer set (Top 20 Beer Types)
top.beer.styles <- beer[, .(TimesTypeInDataTable = .N), by = beer_style][order(-TimesTypeInDataTable)][1:20]

# Only use reviewers who have made over 100 reviews 
top.100.reviewers <- beer[, .(NumberOfReviewsByReviewer = .N), 
                          by = review_profilename][order(-NumberOfReviewsByReviewer)][NumberOfReviewsByReviewer >= 100]

reviewers <- top.100.reviewers[beer, on = "review_profilename", nomatch=0]

top.beers.good.reviewers <- top.beer.styles[reviewers, on = "beer_style", nomatch=0]

quality.data <- quality.beers[top.beers.good.reviewers, on = "beer_name_unique",nomatch=0]

quality.data
#--------------------------------------------------
# Show 
#--------------------------------------------------
# Visually find all the systematic differences you are going to expect



# Think of things that will add noise to your data 
# Random Slope-y things: Quirks of Individual Raters, Quirks of individual Items general level of mean variability
# Things you know are going to be different, aka Gender effect on voice 

# Then think of things that might add in random slopes (basically continuous variables that are random intercepts)

# Make A Null Model with all the noise 

# Then add in IVs you think are goign to help, anvova them, also check for interactions

# Write it up with MixedEffectsTutorialPitch.R 