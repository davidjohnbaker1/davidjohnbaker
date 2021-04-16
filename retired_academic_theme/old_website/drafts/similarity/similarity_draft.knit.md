---
title: "Similarity_draft"
author: "David John Baker"
date: "8/3/2019"
output: html_document
---

One of the reasons that I love research is for the drama.
I love seeing people get really passionate about ideas they care about and coming up with eloquent and convicing ways of making their case.
Yesterday during my morning scroll I came across [Adam Neely's latest video]() covering the most recent case of musical plagerism and thought it was so well done that I messaged [12tone]() about how I wished I were a YouTube music theory star and consequently was inspired to come up with some of my own content.
Of course, I am not a YouTube star with tons of followers, but I am a nerd with a website and spent two hours stuck on plane on a runway yesterday, so I figured I would do the next best thing and try to write a blog post on some related issues.

If you haven't seen the [video]() about Katy PERRY's [Dark Horse]() versus THIS GROUPS [Tune](), I'd suggest you give the video a quick look first so you have some idea of what I'll be talking about.
But if you don't watch those videos, the minimum that you need to know is that THIS GROUP just won a lawsuit against Katy Perry for her alleged rip of this riff with this other one.
I've used Adam's transcriptions here, but in his video he notes that there are more than one way to discuss this.

* ADAM TRANSCRIPTIONS

Now underpinning any claim of musical plagerism is a claim of musical similarity.
And when I started my Ph.D. I was really interested in the idea of musical similarity.
I saw it as a great area of reserach to puruse since not only is it a thorny perceptual question, but the whole legal aspect within [forensic musicology]() seemed like a fun real life application of the work.
Long story short, I seriously considered it as a possible eventual topic for my PhD thesis.

So at the start of my Ph.D. I spent a lot of time reading and thinking about the issues that I would face in trying to do some empirical resarch on musical similarity.
The more I thought about it, the more I realized that questions of similarity (in my opinion) must be some of the hardest questions to model and in this post I wanted to give a whirlwind tour of why I think it's such a hard question and point to some interesting research about it along the way.

## Similar Things

Broadly stated, you could think of the goal of research in musical similarity as being able to say what 'things' are 'similar' to each other.^[Duh.]
This might seem like an easy task in that all we need to do is operationalize two terms here: the 'things' and what we mean as 'similar'.
We should also think about who is asking this question.
Easy enough, right?
We just figure out what musical objects should be our 'things' and then pick a quantitative way to compare the two?

If you watch Adam's video, he does a killer example at [XXX mark]() of annotating a score better than many professional society talks I have been to when comparing what I am referring to as the musical objects.
And it makes sense that he uses Western musical notation to convey this information.
I would assume many people who watch his channel are musically literate, so it makes sense to use these as the musical objects for comparison, after all that's what they presumably did in the court case.

* PICS HERE

But as as your friendly, neighborhood insufferable humanist, what kind of music theorist would I be if I didn't question even the first principles?
What I mean by this is to question if the score is really the best starting point for questions of musical similarity.
The score is used here (and am not saying we shouldn't), but as Adam points out in the video, the score doesn't tell all.

So why is it used here and in this case?

As a bit of an aside, but a relevant one, it's important to highlight that you need to have something written down in order in order to submit it for evidence of infringment of copyright^[CITATION].
I think this is talked about in [this book](), but I remember learning a lot about this at a one-day conference hosted between the College of Music and Dramatic Arts and the [LSU Law School]() on copyright and the arts organized partially by [Christine Corcos]().
Before all the talks started at the conference we hadsome fun morning sessions where the arts people got to learn a bit about the world of law and in that session the lawyers belabored how important it is to have things written down for legal interpretation.

Now you _can_ write down music, but as any [MIR]() person would tell you, "writing it down" is just _one_ way that music can be captured.
If music is written down in notation, that's generally referred to as being encoded symolically.
But of course it doesn't have to be the score, you can also represent sound in the time domain with a [waveform]() or in the frequency domain with a [spectrogram]().

When encoded as a wave form, you would "read" it just like a musical score from left to right and the squiqqgly bumps show the complex waveform that captures the sound.

* Waveform

If you do some fancy math on this waveform called a Fourier Transform, you can break this complex waves into a bunch of smaller parts and take this sound, suspend it in perceptual animaiton, and get a good look at what frequeneies are represented in this moment using a spectrogram.
Inspecting this spectrogram helps figure out aspects of the sound relating to its timbre.

* spectrogram 

One of these representations is not inherently better than the other, they each have their advantages and disadvantages, and within each of these larger categories, you have a whole universe of ways to represent these sounds.

You can get your references for this idea from either [Babbit] or some [MIR books](). 
Both are equally valid ways to capture music, but of the three I have presented here is a bit easier to read in that it gives you more discrete musical objects to bicker about, which is probably one of many reasons that academic musicologists and theorists tend to use a Western musical score as their point of reference.^[And don't forget, in each of these situations, you need a [listener in order to interpret these sounds]().]

So even at this first juncture, we have to make some choices about what our musical objects are going to be that we compare.
You might think I'm getting a bit too pedantic right away here, and if you think that: you're right.
Music theorits love the details.
But let's say we agree that "Yes, we need to be able to 'write it down' in the 'traditional' way so we can submit our claims in written form" you also have to remember that there are also the assumptions when it comes to symbolic forms of 'writing music down' with a Western score. 

This again might seem pedantic, but it's worth considering what kind of other cultural baggage comes along with using a modern Western score as opposed to some early [neumenal notation]() or even the notation used for more improvisatory musical cultures like [documenting Hindustani ragas]().
Imagine how things might change if these two riffs from above were presented as evidence in alternative notations.
All I am trying to say here is we shouldn't just happily accept the defaults that people hand us and think that in some way they are neutral.

In this case we are now calling our musical objects notes and can think of each one as a little digital token.
Now in going down this rabit hole, we are coming dangerously close to being accused of [atomism]() one of my favorite things to be accused of by my non-music psychology colleagues.
Rightfully we are getting too microscopic here and don't experience music as a series of independant little tokens^[Meyer, 1956, pp. 5]
But it's important to dive down to this level just for a bit to see even more problems that plauge questions of musical similarity.

For example, let's now suppose we've now got our notes and each note is a little token.
If we are doing this, we need to ask the question if we really do hear melodies as a string of separate notes?
And do those little tokens even best represent what comes along with each musical event?
Often we have a sense of what key something is in and if you talk to some weirdos, they believe that we hear music as a string of intervals.
The thing is, we can capture all these assumptions in what way we think of notes.

In staying on point to this Dark Horse thing, I've taken Adam's transcription of of of the riffs in question here and used the humdrum toolbox to represent our little lick using using three different digital orthographic notations that capture some of these assumptions we want to include to be a part of our musical 'things'.

The first spine (column) are the notes as Adam notated them in [Humdrum]() format^[For a primer on how to read this, check out [here]()], but without a key signature we don't _really_ know what key we assume this to be in. 
If we really wanted to bake that assumption in we'd use the ```sofla``` tool so that the notes were represented in a key.
Then if you're someone that thinks that the music isn't the notes, but as my trumpet teaher in colleague would sometimes say, the music is between the notes, we can represent the exact same set of notes with a string of intervals growing from a starting pitch.

* Ansi 
* Solfa 
* mint 

Note that each way of encoding the melody has its own musical alphabet.
This becomes important because now we have something computer readable, we can now compare them in an 'objective' way by using some sort of calculation to see how 'similar' they are.

If this of interest of you, there was a whole [special issue of Musica Scientiae]() that explored some of these distance^[similarity, but borrowing a spatial metaphor that further distance means less similar] metrics in depth. 
But with so many distance metrics in place, ranging from the various forms of [Edit Distance]() to [Earth Mover's distance](), to [this other metric](), which should we choose?
They all give slightly different answers and were are yet again confronted with another choice that is messing up our 'objective' quest of modeling musical similarity.

To keep things simple, let's just use the [DAMERAU LEVENSHIM DISTANCE]() since an implementation of it exists as part of the [humdrum extras]() toolbox. 
Now there is no reason can't use same metrics if we wanted on numeric vector that they computer uses to represent both the waveform and spectrograms.
The idea here is now we can borrow some methods from maths and computer science to give us a way to compare two different strings of digital tokens.

If have Adam's two transcriptions encoded as just the notes (the first spine) and we run the [simil]() tool on two separate files with the following bash command (for those playing along at home) we get a value of XXXX.

HUMDRUM CODE

Cool. 
It's XXX.

But what happens if we run this on the interval string instead?
In that case we run 

Humdrum code

And we get XXXX.

But what does this mean?
Let's hold on to that for a second.

Hopefully by this point it's worth pointing out that in many ways this is a great musical manifestation of the biased algorithm problem you read about in all the [AI articles]().
These distance measures or distance algorithms don't just represent unbiased computers, you need to pick what you feed the metrics both in terms of the data you feed it (what melody and how it is encoded) and how you compare it (the distance metric / algorithm).

## Interpreting

No matter what, everytime we run the code above it will come out the the same value.
How do we then interpret this?
Does this mean that most people will also rate the distance between these two metrics as being XXX?
And then what do we make of different values existing between the two ways of representing the notes?
Is the perceptual distance between XXX and XXX a big deal? 
What kind of scale is this one?
Does this also assume that the human brain thinks about this kind of like a computer?
Is that a fair assumption?
There is a lof of disagreement on what people even mean when they say [the human brain even is a computer]() and now we're saying it might be doing this kind of computation?

But you might see another problem here (or many).
If we are still on the quest of getting an 'objective' measure of similarity (or distance), this isn't even what we want.
We are really interested in if our value of XX actually means something.
And to mean something in this conext means is XXX close to what people would actually say?

Well to answer that question means that we probably should do an experiment to see if these are any good measures?
And what does that mean?

Well now we have all the baggage that comes in conducting an experiment.

## Matching with Human Behavior 

Now that we are running an experiment we have a whole separate can of worms to think about.
Who makes up our population that we are going to sample from?
Do we want a big pool of everyone's opinion?
Do we get a bunch of experts?
Who's an expert?
What kind of baggage will experts bring to this task?
What kind of features will non-experts (whatever that means) not pick up on?
Are there [demand characteristics]() in presuming there are certain features of our musical objects we want our particiapnts to attend to?

And then how do you design the actual experiment?
Do you just give your participants two melodies and ask them how similar they are to one another and take one rating?
Would you get the same responses if you presented three melodies and asked to identify the odd one out?
What about if you gave people a batch of melodies and asked them to sort them?

These are all things you have to keep in mind when thinking about collecting human data on (musical) similarity.

But let's say we pick some sort of design that attempts to be [context free](daneil paper) and we get some nice odd-one-out data.
Are we then correct to assume that if our human data closely mirrors one of our similarity metrics that-- as stated above-- the brain is making a similar computation in arriving at this conclusion?

Even if you run a lot of models and pick the one that best mirrors human performance, you still have to think deeply about this assumption and what it means.

## Plagerism 

Now if you're a muscial academic, you might be able to stop here.
You have some musical objects, you know if they are 'close' or not, and can talk about that.
But what if you're interested in musical plagerism?

Maybe you do what DANIEL OR PAT OR DATSET DID and see what metrics best predict court plagerism cases?
You might find that some algorithms predict your ground truth better than others.
But even if you find a great algorithm that is able to predict court cases based on your training data set and you think it'd work on future cases, you're again assuming that this similarity metric is the true driver of the legal system.
Wrong again.

At that workshop I mentioned earlier, my newly made lawyer friends taught me the law is not about both sides getting together to be nice to each other figuring out Truth in the name of humanity.
It's rather a rhetorical bloodbath where everyone is assumed to have access to the same set of facts and after each side presents why it's case is correct, the scales of justice will tip in the right direction.

You can see examples of this in the 20XX Blurred Lines dispute.
In addition to making a case about musical similarity, if you're a lawyer what you also want to be doing is discrediting the guys you're trying to take down and show that they were in breach of the law. 
This is important to consider in that in order to make a copyright infrintment claim (again not a lawywer here, so if a law person reads this and can correct me, please do) you need to prove that those being acused of musical plagerism were aware of the music the ripped ahead of time; it's not just about musical similarity.

This is very hard to do, but the laywers representing the Gaye estate were able to make a very strong legal flex if you watch some of the deposition tapes from the trial. 
Check out [this one in particular]() where a laywer from the Gaye estate is able to show pretty clearly an inconsistency in Pharell' story.
You can also see clips [here]() and [here]() that work to take down Thicke and Pharaell and set them up to look like culture vultures preying on Gaye Estate.
The idea here was that if you make your defendant seem like a liar, they move closer to becoming sitting ducks when lining up the larger, legal case so you can get the gavel to come down on your side.

Again, all this aside, even if you did have the best similarity algoritm in the world (whatever that means at this point) it still will not be enough to provide the "true" answer since there are so many case by case factors at play.

## Sound Color 

Now the estude reader might also take notice that my entire pedantry up until this point has exclusivly focued on the notation without a single blip about timbre!
In my little digitizations from above, nothing was said about what instrument it was played on which the [Neely video makes a great point]() which is huge part of this case and phenomenoloical experience of similarity in this particular case.

So how do you create categories for talking about timbre and add this into our algorithm?
Well if you ask any timbre researcher, they will tell you that it's really, really hard and that might be why the literature is quite sparse when it comes to timbre.
There's work in the of [music perception]() you can read up on, and more recently we've seen work from theorists like [Meagan Lavengood]() exandinng out the conversation.

But whatever you do end up choosing, you run into all the problems I listed before PLUS trying to squeeze timbre in there!

## Dirty Laundry

So this whole tirade is basically all just to say, yeah, musical similarity as the backbone of musical plagerism is much more complicated than Mike Decker probably made it sound.
But importantly, Mike Decker was hired to be an expert witness on one side (defending ...) and the judges have sided with THIS GROUP.
I'm not about to comment on that whole thing right now, but as another important aside I was wondering yesterday if the proefssional societies like the [American Musicological Society]() and the [Society for Music Theory]() will come out with any statements regarding their positionality in future cases like this.
Either way, this clash will force anyone who was skeptical of the power of public musicology to consider the power that YouTube is about to have over future musical discourse.

From academic side, I wanted to air out some of the problems with musical similaritiy for those interested in diving a bit into the weeds of it all since it falls right in lap of music theory and music perception.
There is a ton of great literature on this ranging from the more [theoretical that inspired a lot of my ranting here]() to work from the [legal side on this whole problem]() which at the end of the day made me realize I should to avoid similarity and consequently ended up moving to thinking about memory where you can come much closer to what one would describe as a "right answer" (you either remembered the melody or no, and yes I know it's not _that_ easy).

And cutting through all of this is one thing that my friend [Peter Harrision]() made quite recently in that many of all the problems in psychology, music psychology in particular run into is this question of what categories to pick and I totally agree.
If you ask a scientist what that thing is called, they might call it [operationalization]().
But as far as I am concenred the whole idea of operationalization is basically what we do in the humanities.
We propose, document, and challenge categories that other people put forward.
Look no further than every humanists beef with every music psychology study on emotion for this.

But despite all of these problems, the reason that there is so much to tread through here is because we are talking about cultural objects.
There are no easy answers and if there is anything that brings people who study music together it is a love for messy questions.

* Same thing with complexity-- same problems with what are the musical objects and what is the way that we think about complexity??  
