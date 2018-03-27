#=====================================================================================================
# Song rank post
#--------------------------------------------------

# The past two months have been pretty busy between defending my general exams, presenting at PMD
# some thoughts we have been having at MCCL about how to quantify musicianship, and showing
# off some work jacob and I have been working on for fun having to deal with the analysis of rock music
# I haven't had much time to think about what to blog next about (no one wants to read red tape of writing my thesis).
# and I have yet to come up with a good idea that rivals the Beer blog.
# Of course, Twitter came through when I saw a tweet by THISGUY claiming that 
# there might be some sort of rank order effects on how artists pick which tracks go where.
# It's a murky question to begin with, but the gist of it is that artists tend to lead
# with their best foot forward on albums.
# THISGUY actually posited that some artists list them like XYZ.
#
# Of course I'm not about to do a literature review, specificy my a prior hypotheses,
# then hope to bank on setting planned contrasts, so let's just dig into the data right away.
# The only a priori idea that I do know I wanted to check out ahead of time is if the 
# rank order of a song changed with the advent of streaming technologies in the early 2000s.
# The idea being was that if you had a CD, tape, or record, you'd want to put the 
# good stuff up right away. Especially if you had tapes, no one is about to look for their good songs.

#--------------------------------------------------
# The data
#--------------------------------------------------
# At first I really didn't know what kind of tracks to get, so I just grabbed ...
# I did this with RCharlie's spotifyR package
# I've listed as much code as I can, but to get it to work on your own you need to 
# have your own login information (documented on his stuff).

library(ggplot2)
library(data.table)
library(spotifyr)

# SERVER THINGS HERE
Sys.setenv(SPOTIFY_CLIENT_ID = 'bf9ae528bb5e44379f8fc0bd1891aba3')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'd9035b7dc36a45b8b3d49b5ce096681a')

access_token <- get_spotify_access_token()

#--------------------------------------------------
# What Data? 

# Let's grab all the artists from playlists from 40s, 50s, 60s, 70s, 80s, 90s, 00, Today
# Take whatever album those tracks came off off
# Get the popularity count for each of those albums
# Aggregate across

# Need to chop off and say album needs to have more the 7 tracks, not more than 12
# 


