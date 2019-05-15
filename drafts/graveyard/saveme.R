# Beer Mixed Effects Analysis 

# Script for Running a Mixed Effects Analsyis 

library(ggplot2)
library(data.table)
library(lme4)
beer <- fread('~/Desktop/projects/davidjohnbaker/content/post/data/beer_reviews.csv') 

# Wrote a post with basic linear models, was about to publish, models were bad.
# Gotta pick the right model
# That model is one that takes into account noise from participants and individual beers, have enough data.
# Need to make sure each kind of beer has well over enough ratings
# Not exactly sure approriateness of Mixed models so going to play it safe ??

# Need to get the "good" data out of this
beer[, beer_name_unique := paste(brewery_name,beer_name, beer_style)]

names(beer)

# Beers that have over 30 reviews
quality.beers <- beer[, .(TimesBeerReviewed = .N), by = beer_name_unique][order(-TimesBeerReviewed)][TimesBeerReviewed >= 2000]

# Beer Types that are heavily represented in beer set (Top 20 Beer Types)
top.beer.styles <- beer[, .(TimesTypeInDataTable = .N), by = beer_style][order(-TimesTypeInDataTable)][1:5]

# Only use reviewers who have made over 100 reviews 
top.100.reviewers <- beer[, .(NumberOfReviewsByReviewer = .N), 
                          by = review_profilename][order(-NumberOfReviewsByReviewer)][NumberOfReviewsByReviewer >= 1000]

reviewers <- top.100.reviewers[beer, on = "review_profilename", nomatch=0]

top.beers.good.reviewers <- top.beer.styles[reviewers, on = "beer_style", nomatch=0]

quality.data <- quality.beers[top.beers.good.reviewers, on = "beer_name_unique",nomatch=0]

quality.data
#--------------------------------------------------
# Show 
#--------------------------------------------------
# Visually find all the systematic differences you are going to expect
names(quality.data)

# DV is Review Overall 
# IVs to inspect are aroma, taste, appearance, palette
# Reviewers Should have Random Intercepts and Random Slopes 
# Individal Beers should have random slopes and intercepts 

# Think of things that will add noise to your data 
# Random Slope-y things: Quirks of Individual Raters, Quirks of individual Items general level of mean variability
# Things you know are going to be different, aka Gender effect on voice 

# Then think of things that might add in random slopes (basically continuous variables that are random intercepts)

# Make A Null Model with all the noise 
# Gender --> categorical variable we think that exhasutive inclusion will be able to help with remove systematic noise
# Beer style -- > " ... " 
# Attitude and Subject are ITEM LEVEL and SUBJECT LEVEL Random Factors 
# subjects will have their own level of quirky ness 

# 1 + thing that we want to have Random Slope control for 

beer.null <- lmer(review_overall ~ beer_style + 
                    (1 + review_overall|review_profilename) + (1 + review_overall|beer_name_unique),
                  data=quality.data, REML=FALSE)

# review_aroma + review_appearance + review_palate + review_taste
beer.ar <- lmer(review_overall ~ review_aroma + beer_style + 
                  (1 + review_overall|review_profilename) + (1 + review_overall|beer_name_unique),
                  data=quality.data, REML=FALSE)

beer.ar.ap <- lmer(review_overall ~ review_aroma + review_appearance + beer_style + 
                     (1 + review_overall|review_profilename) + (1 + review_overall|beer_name_unique),
               data=quality.data, REML=FALSE)

beer.ar.ap.pa <- lmer(review_overall ~ review_aroma + review_appearance + review_palate + beer_style + 
                        (1 + review_overall|review_profilename) + (1 + review_overall|beer_name_unique),
               data=quality.data, REML=FALSE)

beer.ar.ap.pa.ta <- lmer(review_overall ~ review_aroma + review_appearance + review_palate + review_taste +beer_style + 
                           (1 + review_overall|review_profilename) + (1 + review_overall|beer_name_unique),
               data=quality.data, REML=FALSE)
summary(beer.ar.ap.pa.ta)

anova(beer.null, beer.ar, beer.ar.ap, beer.ar.ap.pa, beer.ar.ap.pa.ta)

# Then add in IVs you think are goign to help, anvova them, also check for interactions

#======================================================================================================

#

