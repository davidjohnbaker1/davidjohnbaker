---
title: A short reflection after writing my first, little Stan model
author: Package Build
date: '2023-06-14'
slug: []
categories: [computation, stan, R, stats, Bayes, postdoc]
tags: [computation, stan, R, stats, Bayes, postdoc]
draft: no
---

During my postdoc, I've resolved to better understand Bayesian statistics.
This started a few years ago, when I organized a group of colleagues to painstakingly make our way through [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/).
We started by watching the [2019 YouTube Lectures](https://www.youtube.com/watch?v=4WVelCswXo4&list=PLDcUM9US4XdNM4Edgs7weiyIguLSToZRI), then met several times during the pandemic and as a group.
I think we discussed at least half of the book and did all the corresponding problems in the back of the chapters.

Fast forward a few years, I am now working somewhere where my one of my colleagues writes all his models in [Stan](https://mc-stan.org/users/documentation/).
Obviously a good reason to try to jump in the deep end. 

This morning I spent a few hours writing out a simple between groups comparison (~ a t-test ~) using data from a paper from my PhD that is currently under review. 
The paper has been under review for longer than I care to admit publicly, but I know this data and our [NHST analysis](https://en.wikipedia.org/wiki/Statistical_hypothesis_testing) of it pretty well.

My idea in doing this was to simply ask the same research questions that I did in our current analysis, but do so in a Bayesian way.

After completing my first pass of this, boy, do I have some thoughts.

The most salient thought (feeling?) I had was I feel as though I now have a better understand why some Bayesians are so anti-YES/NO metrics at any point of the statistical modeling pipeline.
I get advantage of p-values, I've reported many myself, I have also seen them used as a substitute for critical thinking on many occasions. 

Coding up what was essentially a t-test in Stan of course makes you have to critically consider every element of your model.
The task I was modeling is well-established and there are published expected norms for this.
A great choice for priors!
Choosing how to specify how your categorical variables are encoded (index versus dummy coding) has implications for priors (p.158 of 2nd Edition of Statistical Rethinking).
This may have not mattered given the size of our data, but it was good to stop and think about.
After estimating the posterior of these group parameters, you can then compute a contrast between the two.
Staring at these posterior distributions really does reflect a rich set of scientific choices.
Though the NHST and Bayesian parameters were nearly identical, I like being able to understand the numbers I am seeing as possible/credible values given the data and model.

Going through this process of course slowed me down (I am sure I can now do a similar analysis faster), but I think this is an advantage.

The concepts and ideas presented in [McElreath's](https://twitter.com/rlmcelreath) Rethinking course have made doing this magnitudes easier.
I found myself flipping all over my copy of the book to re-fresh knowledge I knew I did have on these topics.
Really, I could not have asked for a better set of training wheels going into this. 

Just like when I jumped from SPSS to using R and thought "Wow, I can't believe how much statistical software can sweep under the rug!", I am re-living that feeling again jumping from R to Stan/Rstan. 

Excited to see where this goes. 

* [Comment on this post on Twitter]()
