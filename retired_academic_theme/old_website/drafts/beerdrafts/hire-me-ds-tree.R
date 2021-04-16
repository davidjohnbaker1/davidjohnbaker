#======================================================================================================
# Tree Based Methods 
#======================================================================================================
# Attribute to Tabi
# Alsoread about them this break with Connor in ISLR
# Good for dealing with strange distributions
# And easy to interpret
#======================================================================================================

library(ggplot2)
library(data.table)
library(MASS)
beer <- fread('~/Desktop/projects/davidjohnbaker/content/post/data/beer_reviews.csv') 

# Want to be able to split our data into regions 
names(beer)

set.seed(1)

train <- sample(1:nrow(beer),nrow(beer)/2)
length(train)

tree.beer <- tree(review_overall ~ review_aroma + review_appearance + review_palate + review_taste, 
                beer,
                subset = train )

summary(tree.beer)
plot(tree.beer)
text(tree.beer , pretty = 0)



cv.beer <- cv.tree(tree.beer)
plot(cv.beer$size, cv.beer$dev, type='b')



# beer.avg <-beer[, .(MeanReviewOverall = mean(review_overall),
#                    MeanReviewTaste = mean(review_taste),
#                    MeanReviewPalate = mean(review_palate),
#                    MeanReviewAroma = mean(review_aroma),
#                    MeanReviewAppearance = mean(review_appearance)), by = beer_style]
# 
# cor(beer.avg$MeanReviewOverall, beer.avg$MeanReviewPalate)
