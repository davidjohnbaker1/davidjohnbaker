#======================================================================================================
# Beer Script
#======================================================================================================
# Library
library(ggplot2)
library(data.table)
library(stringr)
#======================================================================================================
beer <- fread("~/Desktop/beerproject/beer_reviews/beer_reviews.csv")
#======================================================================================================
names(beer)

beer
beer[, .(NamesOfBrewery = unique(brewery_name))]
beer[, .(Reviewer = unique(review_profilename))]
beer[, .(BeerNames = unique(beer_name))]
beer[, .(BeerStyles = unique(beer_style))]

table(complete.cases(beer))
67785/1518829

beer.complete <- beer[complete.cases(beer)]

beer.incomplete <- beer[!complete.cases(beer)]

beer.complete[beer_beerid == 3274]
beer.incomplete[beer_beerid == 3274]

foo <- c(1,2,3,4,5,6,7)
bar <- c(4,5,6,7,8,9,10)
intersect(foo,bar)
intersect(beer.complete$beer_beerid, beer.incomplete$beer_beerid)

beer[!complete.cases(beer)][, .(.N = unique(beer_name))]
14110/56857

beer[969]

# Brewery that produces Strongest Beers by ABV 
beer.complete[, .(AvgABV = mean(beer_abv)), by = brewery_name]

abv.counter <- beer.complete[, .(AvgABV = mean(beer_abv), SdABV = sd(beer_abv)) , by = brewery_name][order(-AvgABV)]

NoOfBeers <- beer.complete[, .(NameOfBeer = unique(beer_name)), by = brewery_name][, .(.N), by = brewery_name]

abv.table <- NoOfBeers[abv.counter, on = "brewery_name"]

abv.table[, zAvgABV := scale(AvgABV)]

# How many beers to count for a big brewery? 

hist(NoOfBeers$N)

NoOfBeers[N > 100] # Rock Bottom ! 

abv.table[N >= 5, ][order(-AvgABV)]

hist(abv.table[N >= 5, ][order(-AvgABV)]$zAvgABV)

abv.table[N >= 5 & zAvgABV > 4, ][order(-AvgABV)]

schor.abv <- beer.complete[brewery_name == "Schorschbräu", .(beer_name = unique(beer_name)), by = beer_abv]

ggplot(schor.abv, aes(x = beer_name, y = beer_abv)) + 
  geom_bar(stat = "identity")  + 
  labs( title = "Schorschbräu Beer ABV", x = "Beer Name", y = "ABV") +
   theme(axis.text.x=element_text(angle = -90, hjust = 0)) 

#======================================================================================================
# Going deeper

# Of course one of the most important things about research is not assuming you know everything and 
# relying on the expertise of your colleagues to help you out when your knowledge isn't enogh.
# After I had drafted this first answer, I sent it to lab mate, friend, and most imporantly beer
# connesiour Adam to see what he thought. 
# He pointed out that one thing that this analysis did not take into account was the how that beers
# that are traditionally brewed to have a higher ABV (like IPAs and Belgiums) might skew your results.
# So if you are a big IPA brewery, you are going to have higher average ABV bc of your beers!
# 
# I went through and did another analysis of the dataset, this time taking into account this confound
# as well as looking at larger breweries, just to show how much an answer can change when you operationalize
# your question differently.

# AR: or instance, a lager with 6.5 abv would be waaaaay higher than the mean (probably over 4 standard deviations), 
# but thats still below mean for an ipa

# Find Average ABV of each beer type

sem <-function(x) {sd(x)/sqrt(length(x))}

abv.by.type <- beer.complete[ , .(MeanAbvType = mean(beer_abv), 
                                  SdAbvType = sd(beer_abv),
                                  semABVType = sem(beer_abv)), 
                              by = beer_style]

ordered.abv.by.type <- abv.by.type[order(-MeanAbvType)]
ordered.abv.by.type$beer_style <- factor(ordered.abv.by.type$beer_style, levels = ordered.abv.by.type$beer_style)

ggplot(ordered.abv.by.type, aes(x = beer_style, y = MeanAbvType)) + 
  geom_bar(stat="identity") +   coord_flip() +
  labs(title = "Average ABV by Type of Beer",
       x = "Beer Style",
       y = "Mean ABV, bars represent SD") +
  geom_errorbar(aes(ymin=MeanAbvType-SdAbvType, ymax=MeanAbvType+SdAbvType))
  theme_bw() 
  
# You get an advantage if you brew Barley Wines, Belgian Stouts, Less for light lagers.
  
# In order to account for this need to see how beers compare relative to their group
# Do this using zscores 

beer.complete.avg.abv <- abv.by.type[beer.complete, on = "beer_style"]
beer.complete.avg.abv[, zABV := (beer_abv-MeanAbvType)/SdAbvType]  
zAvgBeers <- beer.complete.avg.abv[, .(AvgAbvZ = mean(zABV)), by = brewery_name][order(-AvgAbvZ)]
BreweryAndAvgAbv <- zAvgBeers[NoOfBeers, on = "brewery_name"]

BreweryAndAvgAbv[N > 100][order(-AvgAbvZ)]

beer.complete[, (.N), by = beer_style][order(-V1)][1:25]

#======================================================================================================

#If you had to pick 3 beers to recommend using only this data, which would you pick?
# Want three beers, ideally far apart in taste, take into account user reviews

## Who is doing the reviewing? Lots of people contributing equally? Or are there super users?

### Who is doing the reviews?

review.counts <- beer[, .(.N), by = review_profilename][order(-N)]
review.counts 
hist(beer[, .(.N), by = review_profilename][order(-N)]$N, 
     breaks = 200,
     xlab = "Number of Reviews",
     main = "Distribution of Reviews Per User")

## See some sort of outlier situation here, looks like long tail problem in reccomender systems

## What if we just take people with more than 500 reviews , serious assumption, but again believer most stuff is garbage
## People signing up for the website, app, thinking they are going to contribute, then not, I do that all the time

sum(review.counts$N)
sum(review.counts[ N > 500]$N)

731066/1586614

5817/731066

## Still each point now still is less than 1% of the whole thing, not going to have too much leverage
## Let's grab these people out 

super.users <- review.counts[ N >  500]

## Now we need to use this table to index out from our complete.beers table (assuming we want ABV to play into it)

super.reviews <- super.users[beer.complete, on = "review_profilename", nomatch=0]

689329/1586614
# Over half a million reviews is fine...

## Of these super reviewers, let's get ones that have tried a lot of different KINDS of beers
## I don't trust beer reviews from people who just drink IPAs

## Need to lookat all our beers to see what they are dealing with 

super.reviews[, .(beer_styles = unique(beer_style))]
beer[, .(beer_styles = unique(beer_style))]

## Every beer style has been accounted for, don't have to use the union() or intersect() functions in R (super helpful!!)

## By this point need to figure out what Three KINDS of beers I want to be recc'd

## Super User's Popularity Beer, defined a priori as beer most reviewed by super users with highest rating 
## Long Tail/Bizzaro Super Users Beer, same rating profile as Super user BUT comes from the long tail 
## Designated Driver Beer: Beer with best taste profile, but lowest alcohol content 

### Super User's Popular Beer 

## First need to find of the super.reviews, which are the ones with most reviews?

super.reviews[, .(most_reviewed_beers = .N, brewery_name, beer_style), by = beer_name][order(-most_reviewed_beers)]

## Whoops, clearly need to create new varible that is identifiable that isn't a unique ID, previous command was not doign what i thought

super.reviews[, beer_name_unique := paste(brewery_name,beer_name, beer_style)]

length(unique(super.reviews$beer_beerid))
length(unique(super.reviews$beer_name_unique))

### Pretty close
42703/42805

## Can asssume that this variable is what we think it is, probably encoding error can find another time

super.reviews.popular <- super.reviews[, .(most_reviewed_beers = .N), by = beer_name_unique][order(-most_reviewed_beers)]

hist(super.reviews.popular$most_reviewed_beers)

## Again we see stuff that clearly not all beers are reviewed equally, this is not a controlled experiment.

## Let's then just grab the top 100 beers of the super user's popular beers and then find the best one.

super.reviews.popular.100 <- super.reviews[, .(most_reviewed_beers = .N), by = beer_name_unique][order(-most_reviewed_beers)][1:100]

## Mix that in like we did before to get the rating data and ABV data I wanted to use 

super.reviews.cream.of.crop <- super.reviews.popular.100[super.reviews, on = "beer_name_unique", nomatch=0]

super.reviews.cream.of.crop[, .(mean_review_overall = mean(review_overall)), by = beer_name_unique][order(-mean_review_overall)][1:10]

# of course I could mess with the things above and changing parameters will swap it out, but have my first beer to go try.

# So now I know that I know I want to get my hands on the Russian River Brewing Company Pliny The Elder American Double / Imperial IPA
# let's move to second question and move to a riskier reccomendation
# Need to find beer that matches as closely as posible to the Russian River Pliny The Elder American Double, BUT 
# it has to be an Imperial IPA that comes from the a place that is not as stable.
# Important to ahead of time (theorst in me!) to say what I am looking for in data, or going to go on fishing expedition
# This also makes writing the query a lot easier...

# Want to find an Imperial IPA that provides the smallest distance metric on means and sds of all parameters of the Russian,
# BUT it needs to have to come from any sized brewery and have more than 30 (for good measure) but less than 100 reviews with it. 

beer[brewery_name == "Russian River Brewing Company", .(RRBCuniquebeers = unique(beer_name))] # Brewery that has 65 beers 


beer[, beer_name_unique := paste(brewery_name,beer_name, beer_style)]

#--------------------------------------------------
# Unique Beers and brewery code
beers.and.breweries <- beer[, .(uniqueBeers = unique(beer_name_unique)), by = brewery_name]
number.unq.beer.brewery <- beers.and.breweries[, .(NumberOfBeers = .N), by = brewery_name ][order(-NumberOfBeers)]
#--------------------------------------------------

# Let's make variables we want
names(beer)

# need to have beers with more than thirty reviews 

number.of.reviews <- beer[, .(NumberOfReviews = .N), by = beer_name_unique][order(-NumberOfReviews)]
reliable.beers.list <- number.of.reviews[ NumberOfReviews >= 30 ]

beer.reliable <- reliable.beers.list[beer, on = "beer_name_unique", nomatch=0]

beer.metrics <- beer.reliable[, .(mean_review_overall = mean(review_overall),
                                  mean_review_aroma = mean(review_overall),
                                   mean_review_appearance = mean(review_appearance),
                                   mean_review_palate = mean(review_palate),
                                   mean_reviw_taste = mean(review_taste),
                                   sd_review_overall = sd(review_overall),
                                   sd_review_aroma = sd(review_overall),
                                   sd_review_appearance = sd(review_appearance),
                                   sd_review_palate = sd(review_palate),
                                   sd_review_taste = sd(review_taste)), 
                               by = beer_name_unique]

## Get only IPAs with less than 100 reviews

less.reviewed.beers <- number.of.reviews[NumberOfReviews <= 100 & NumberOfReviews >= 30]
find.IPA <- str_detect(string = less.reviewed.beers$beer_name_unique, pattern = "Imperial IPA")
bizzaro.candidates <- less.reviewed.beers[find.IPA]

bizzaro.candidates.metrics <- bizzaro.candidates[beer.metrics, on = "beer_name_unique", nomatch=0]

# Of these less rated beers, find one that is closest on all the dimensions
# Do this by subtracting numbers from our target from all others

rrbcpteadii.metrics <- beer[beer_name_unique == "Russian River Brewing Company Pliny The Elder American Double / Imperial IPA", 
                           .(mean_review_overall = mean(review_overall),
                             mean_review_aroma = mean(review_overall),
                             mean_review_appearance = mean(review_appearance),
                             mean_review_palate = mean(review_palate),
                             mean_reviw_taste = mean(review_taste),
                             sd_review_overall = sd(review_overall),
                             sd_review_aroma = sd(review_overall),
                             sd_review_appearance = sd(review_appearance),
                             sd_review_palate = sd(review_palate),
                             sd_review_taste = sd(review_taste))]

key.vector <- as.vector(rrbcpteadii.metrics)
search.vector <- bizzaro.candidates.metrics[, -c(1,2)]


names(key.vector)
names(search.vector)

search.vector[1]- key.vector

ipa.distances <- apply(search.vector, 1, function(x) x - key.vector)
ipa.distances.dt <- data.table(do.call(rbind.data.frame,ipa.distances))
# Combine this back with vector with names 
bizzaro.candidates.distances <- cbind(bizzaro.candidates.metrics, ipa.distances.dt)

bizzaro.candidates.distances[order(-mean_review_overall)]
# Could go deeper and measure on each dimension, talk about which are more important in this metric
# But just looking to show how I would do something so going to go with 
# Hill Farmstead Brewery Galaxy Imperial Single Hop IPA American Double / Imperial IPA 


## Last Beer I'd Reccomend 
## Designated Driver Beeer

## Use Complete Beer bc need ABV, then get highest average rating 

beer.complete[, beer_name_unique := paste(brewery_name,beer_name, beer_style) ]

# ABVs and Mean Scores
abv.vs.mean <- beer.complete[, .(Abv = mean(beer_abv), MeanOverall = mean(review_overall)), by = beer_name_unique]

ggplot(abv.vs.mean[Abv < 20], aes(x = Abv, y = MeanOverall)) + 
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  geom_smooth(method = "lm", formula = y ~ poly(x,2), color = "orange") +
  labs(title = "Rating as Function of ABV (Beers with than 20% ABV)",
       x = "ABV Content",
       y = "Mean Overall Rating")

abv.linear <- lm(MeanOverall ~ Abv, data = abv.vs.mean[Abv < 20]) 
abv.poly <- lm(MeanOverall ~ poly(Abv,2), data = abv.vs.mean[Abv < 20])
summary(abv.linear)
summary(abv.poly)

# can use beer reliable again to make sure we're making decent reccs

# Quality Assurance Step 
reliable.and.abv.beers <- reliable.beers.list[beer.complete, on = "beer_name_unique", nomatch=0]

dd.beers <- reliable.and.abv.beers[, .(mean_overall = mean(review_overall), abv = mean(beer_abv)), by = "beer_name_unique"]

## Make graph to point out way to model ABV and overall taste 

# Take that bad boy outlier 
dd.beers.2 <- dd.beers[mean_overall > 4.6 & abv < 10]

ggplot(dd.beers.2, aes(x = abv, y = mean_overall, label = beer_name_unique, color = beer_name_unique)) + 
  geom_point() + 
  geom_text(aes(label=beer_name_unique),hjust=-.01, vjust=0) +
  labs(title = "High Quality Beers with Low ABV",
       x = "ABV",
       y = "Mean Overall Rating") + theme(legend.position = "none") + 
  xlim(0, 20) +
  scale_y_continuous(breaks = c(seq(4.6,5,.1)), limits = c(4.6,4.85)) 

#======================================================================================================
# Which of the factors (aroma, taste, appearance, palette) are most important in determining the overall quality of a beer?

## This is pretty much a regression problem 
## DV is Overall Quality, IVs are the other four
## Problem is we have TONS of missing data here and it is not sampled in such a way that you "Should" use Multiple Regression
## So going to run it as multiple regression as is, but then again as Linear Mixed Effects Model

## See how variables relate to each other , collinearity 

hist(beer$review_overall)
hist(beer$review_aroma)
hist(beer$review_appearance)
hist(beer$review_palate)
hist(beer$review_taste)

apply(beer[, .(review_overall, review_aroma, review_appearance, review_palate, review_taste)],2, skew)
apply(beer[, .(review_overall, review_aroma, review_appearance, review_palate, review_taste)],2, kurtosi)


cor(beer[, .(review_overall, review_aroma, review_appearance, review_palate, review_taste)])

predict.overall <- lm(review_overall ~ review_aroma + review_appearance + review_palate + review_taste, data = beer)
summary(predict.overall)
## aroma and appearance contribute, but might just bbe because of high numbers

predict.overall.occam <- lm(review_overall ~ review_palate + review_taste, data = beer)
summary(predict.overall.occam)
# Adjusted R2 barely changed, def remove them from the model

# Problem here is that we still have collinearity.

#--------------------------------------------------
# If you like aroma and appearance, what STYLE should I try ? 

# IV aroma and appearance 
# DV beer style 

# Thinking out loud this would mean that you would want the group of beers that scores heighest on aroma and style 

sem <-function(x) {sd(x)/sqrt(length(x))}

names(beer)
question4.means <- beer[, .(mean_aroma = mean(review_aroma), mean_appearance = mean(review_appearance), 
                            sem_aroma = sem(review_aroma), sem_appearance = sem(review_appearance)), 
                        by = beer_style]

question4.means

ggplot(question4.means, aes(x = mean_aroma, y = mean_appearance, color = beer_style)) + 
  geom_point() +
  geom_errorbar(aes(ymin=mean_appearance-sem_appearance, ymax=mean_appearance+sem_appearance), width=.1) +
  geom_errorbarh(aes(xmin=mean_aroma-sem_aroma, xmax=mean_aroma+sem_aroma)) + theme(legend.position="none") +
  labs(title = "Mean Appearance and Aroma", y = "Mean Aroma", x = "Mean Appearance") 

## Let's Zoom in on that Upper Quadrant 

ggplot(question4.means[mean_appearance > 4 & mean_aroma > 4], aes(x = mean_aroma, y = mean_appearance, color = beer_style)) + 
  geom_point() +
 # geom_errorbar(aes(ymin=mean_appearance-sem_appearance, ymax=mean_appearance+sem_appearance), width=.1) +
#  geom_errorbarh(aes(xmin=mean_aroma-sem_aroma, xmax=mean_aroma+sem_aroma)) + theme(legend.position="none") +
  labs(title = "Mean Appearance and Aroma", y = "Mean Aroma", x = "Mean Appearance") + 
  geom_text(aes(label=beer_style, hjust = .5, vjust = -.75))



## Could this just reflect overal preference, need better data 

#======================================================================================================
# See if there are ABV measures for certain beers in set

