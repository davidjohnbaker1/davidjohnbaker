---
title: 'Orgflow: 1. The Orgflow Theory'
author: Package Build
date: '2023-02-07'
slug: []
categories: [orgflow, gtd, emacs, orgmode, productivity, worklife balance, quality of life]
tags: [orgflow, gtd, emacs, orgmode, productivity, worklife balance, quality of life]
draft: yes
---

If I had to describe my orgflow system in a single pass, I think it would be this.

> The orgflow system is one possible implementation of [GTD]() using [emacs]() [org-mode]() to help externalize and plan work from the bottom up. Work, as David Allen puts it, is anything in your life that is <work definition>. 

If you're familiar with both GTD and org-mode, there's not really much new for you here.
This post will focus more on the GTD aspects and how I combine them with org-mode.
Again, check out the GTD audio book if you'd like to leanr more about it. 

I think the most important principle (for me) behind GTD is that your brain is for thinking and not remembering.

If this is true, then our goal should be to externalize _any and every_ kind of "remembering" task to some *TRUSTED* source.
This source needs to be able to hold both structured and unstructured information.
Making a clear distinction between the two is also an essential part of this system. 

What results is essentially a giant menu of *actionable items* that you _could do_ given external pressures like time, urgency, location, and your own energy levels.
It is a fair amount of work to maintain this kind of system, but I find that it's 100x better than walking around with the anxiety associated with not (when you feel you have a lot to do!).

With everything in one place, you always have what you need to get rolling on a project.
No scrambling for materials, it's all there, and if you're doing it right, you know exactly what to do, when you get the time.

So what does it look like at a high level?

Well it's essentially a giant text document that you can search and interact with in sophisticated ways.
I've set it up in such a way that I can see all levels of whatever hierarchy I am on without scrolling around (using vim key mapping of course! remember, this should be fun!).

<Picture of All H1 Here> 

The document is organized hierarchically, using the following principles for the Headers (H):

* H1: Major Areas of Focus 
* H2: Projects
* H3: Project Files 
* H4: Actionable Items
* H5 and H6: Use as needed

*Major Areas of Focus* divides my work into the major areas of my life that I want to organize and track.
These could be organized a different way, possibly into different documents, but this configuration works well for me at the moment.
Some of the topics might appear to be self-explanatory, but they all have a very specific meanings.

_Capture_ is a fundamental GTD concept where all unorganized "stuff" goes before it becomes an actionable item. 
As I am going throughout my day, if I see something I want to read, or an email that I want to respond to that will take me more than 2 minutes, I copy the link and throw it under _Capture_ to be dealt with at another time.

At the end of the day when I have 100 tabs open, I copy out the links I really want and put them in capture and x'out the rest.
This header also holds all of my other GTD related information, like tracking when I do my weekly review, and notes to myself I want to come across on a regular basis. 

_Work_ is the heading that is related to any _responsibility related to income_.
For the most part, this is just where I keep my _work_ for my job at the [University of Amsterdam](), but every so often I will do a guest lecture, or some sort of assessment.
Separating out where there is a clear exchange of money from projects that are not tethered to this committment is also helpful for knowing what needs to get priortized.
I also track here any sort of future work (when I am applying to jobs, which is something that [is often on my mind]()).

The _Projects_ header refers to <DEF, page>. 
Here is where I keep each bundle of work that has a clear end. 

It's essential that a  _project_ must have a clear end goal, and under each header, I have written what it would mean to complete this project.
This leads to more actionable/deliverable oriented thinking on my projects and helps me from feeling that my work does not have clear boundaries.
Not all the projects I have here have the same priority, it's just where they live.
Some people might find this type of thinking a bit too corporate, as the nature of academic work is that it's always changing, but if this happens, you just change the project...

One thing I very much like about the GTD method is that it does not let force you to try to prioritize between your work/projects on a longer time scale.
Each week you do a pass of everything (the weekly review) and are allowed and encouraged to re-negotiate each commitment you have made to yourself about your unending project list.

It used to bother me that I would have so many dormant projects, but a big part of that was because I felt I needed to keep them all on the same priority status.
This is totally unsustainable and unrealistic and giving yourself permission to see each thing you want to do each week and just say "I see you, but not this week" has been tremendously helpful for me personally. 

The _Service_ , _Travel_ , _Personal_ , and other categories are a bit more self explanatory. 
Service is what I do for work but am not paid to do (peer review, work I did as part of SMPC's ARE committee), personal matters deal with money, taxes, relationships, family, food I'd like to cook one day all go here.

_Reading_ is just a big dumping ground for anything I might want to read.
Each link is very clearly labelled so I can peruse it when I have time to read or search it within emacs.

Then the rest either deal with archiving projects or information I want access to in working with my orgflow system. 

Most *second level headings H2* are projects.
As noted above, this is <DEF>.

For example, a paper that I am working on will be a project.
I know what it means for a project to be "done" (e.g. a paper accepted at a journal with my name on it; saving enough money to buy X; being able to bench, squat and deadlift over 1,000lb cumlatively).

Under this H2 heading, you'll see a few things that I track here.

<EXAMPLE H2 Heading> (Use psychometrica)

Here you will see the _Logbook_, which is org-mode's way of tracking time on a task or project. 
I use this feature a lot, but never do anything with the data.
It's more so I can have my default mode in life to be "no working", then when I start a clock, I am then "working".

I will also have several hyperlinks near the top-level of each project.
Maybe it links to the Google Doc where the shared draft of a manuscript is, maybe it goes to the associated git repo. 

Then below this information is where I just use my own judgment to organize all the project files.

Examples from this one are things like IRB, Introduction drafts, Methods (when someone else is writing this), meetings concerning the project. 
Once you are in an H3 heading you have a pretty good idea of what world of the project you are in.
For example, writing the methods of a paper that I am working on seems like very tangiable as a headspace that I might find myself in. 
And what do you do in those headspaces?
You do the actual work.

This is the reason why I use the H4 heading as the actionable TODO item.

The actionable items is the basic unit of work that is needed to move something forward.
Nearly every actionable item is tagged with a TODO.

In org-mode, you can cycle through different TODO states (mine are TODO, WAITING, DONE DELEGATED, but can be whatever you want).

<TODO Cycle Gif> 

Each task is also tagged with the context, (the location, urgency, whatever) that makes them index-able (sp?).
I asked people about this [on twitter ages ago]() and was just met with confusion but hopefully this makes more sense now. 

I try to use the H5 and H6 heading sparingly.
They do get used, but often to track meeting about things, or if I need to break up a complex TODO like I show below.

< Meeting screensho> 

You can see that there is a lot of information in this document.
It's like a bit _too much_ to go over in one sitting if you are using this massive amount of information to  figure out what you need to do when. 
But that's where many of the features of it being a text document within org-mode shine.

Remember, the goal is to be able to come to your computer, take a moment to see how you feel, then choose from a menu of options what you could do, given your time, location, urgency, and other (tagged) constraints. 
As everything you ideally need is right there, once you start on a task, everything that you might need is at your fingertips. 

So let's see what this looks like in action. 

Imagine you have about 10 minutes before your next dreaded Zoom call, are feeling a bit tired, are drinking your coffee, and don't want to just doomscrool for a few minutes. 

What you could do is use the `FAST` tag to find all tasks that might be able to be done in this short time frame. 

I'd type: 

`C-c a` `m` `Fast` `Return`

Which looks like this: 

SHOW FAST 

I can then see whatever options, with any other tagged urgency/time information that helps me decide what I can do. 

Or maybe you are not in a time crunch but are just sitting down to your first moments at your desk and want to get an overview not of what you think you should be doing when (aka the top down time blocking method that always breaks down for me).

I'd run a similar sequence to bring up a two week overview of everything I need to see on the immediate horizon. 

`C-c a` `a` 

Which brings up something that looks like this: 

Note from this view you get two weeks of things that are scheduled for specific times, days, and deadlines.
You can also see all the urgency tags from here.

From this view you can also cross off items (cycle through with C-t), throw items into your archive of all todos you have ever done which live in a big file (C-c C-x C-a) or push TODOs around in time (Shift + right arrow, for example).

Examples of this are below:

< HERE > 

That's pretty much the high level features of what I use daily.
Everything I need to do lives here and I update it regularly so I trust what I need to do lives here.
Seeing _all_ that I have to do in a two week span makes it much easier to [say no]()
 to items that do not align with my strategic goals (something I come across frequently at the top of the document).
 
And as I have a pretty established GTD flow (borrowed the image from below from X), I can walk away from work in a way I felt like I couldn't in the few years prior. 
I find this system also removes a lot of the fatigue of having to decide what to do before you do something that is already draining.

<GTD Flow  Document> 

This system is a lot more involved than other ways I have worked, but as there are very clear established modes or loops I can find myself in (with clear steps at each one), this allows for very clear guide rails of HOW to work when sitting down.

Next, the next post is supposed to be how to set this all up, but I might just skip that for now and talk more about high level items.
I might not write that until I have more than two people requesting what this might look like.
I think the other posts I planned in this series will be valuable for anyone, regardless of if they use emacs. 

[Comment on this post on Twitter]()