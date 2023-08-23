disclaimer: it's 6:00AM and I've been awake for 20 hours.
#### HMMMMMM
It would be neat to have a simulated robot. That way I could use some neural nets to quickly test it.  
  
Guess that means it needs a simulated world to exist in, which is a pretty tough little problemerino. Maybe there's a nice crate for that. 

Quick Gooba search reveals I'm insane and should use an existing physics engine. Yea that makes sense. Idk I like Rust tho. 

Wannaaaaaa:
* create model for robit
* simulate physics on model
* have robit able to move
* this sounds like a game engine

Okay so game engine. Unity / Unreal or whatever would probably work then. I think I've seen people use that actually in robit wideos.

Buut maybe there's a cool Rusty one. 

OOOOOOOHHHHH Rapier! https://rapier.rs/

okay this does look neat as fuck
small problem

it reminds me that a physics engine is a fundamentally screwy way to train something for the real world
cuz it ain't real
it's gotta round numbers

However

I think my goal is still to get good at the deep learning thing
so it's not a bad place for that

if it learns to use bugs but works
it works

and the real one will too

prolly.

okay so here's how rapier goes
1. get the rapier
2. makey the robutt
3. figure out how makey robutt move
    * wait but so 
    * gotta make the rusty code
    * movey robutt
    * ????

right so like there's a few types of exercises
endgame I hit W and this think walks, right?
but like we're not there yet
FIRST step
is simulation "starts"
there just *is* a little shape or something
and it tries to stay balanced or whatever even though noise is a thing making it fall over

so I guess there's got to be some function right
that's the "actor" / "agent" / "cute lil fella"
the AI
and it just fuckin like
really wants cookies
so I give it cookies for staying standing

function(state, memories): Void
so it knows how the world is
some stuff it did before and how the world was then
and how many cookies it got
and so it forms a little hypothesis
maybe if I do stuff like that I'll get more cookies
also I guess it could try to do little experiments
which part of that stuff
got me the cookies?
that's a kinda cool idea actually. 

function be(state, memories)
so then it's not just a simple optimization function

but like a feller
a guy

it has multiple types of motivation-y things in long-term pursuit of cookies.

a little lost here, hold on

so how about at first it squirms like a regular ML thingy
trys some random stuff with its "limbs" (weights) and sees what happens
but then like
the main loop is hypothesis testing. 

function test(hypothesis): testresult

"if I look towards momma, I get cookies" <== hypothesis
in one trial, I should look towards momma
in others, I should not look towards momma (or look towards not momma, etc)
then I should evaluate if there's a significant relationship between the number of cookies in the two trial groups

if looking towards momma is positively correlated with cookies
then, being that I pursue cookies, it would seem perhaps at this stage to be a good idea to look at momma

looking at momma, getting cookies, this is alright
BUT
*crucially*
I get LESS cookies every time
I'm getting bored

I
need
to
find
more
ways
to
get
cookies

this seems like a very interesting part of a reward function

it seems like a good idea to have progressive rewards to
desired task:
* move left arm
* move left arm down
* push self up with left arm
* ditto right arm
* push and fall in certain way
* get the fuckin legs in there
* push self towards momma
* hoo baby, we learnin to crawl

cuz again the goal is to teach the robot to move itself in response to commands

so if I tell it "move forward"
it needs to be able to break that into steps
move forward means lifting one leg and leaning and making sure you're not falling over sideways and correcting for that and extending legs .....

almost like it needs to create a set of rules for movement
not just values like move forward is "adjust knee to 50 degrees then hip to 20"
but like "lift leg (adjust knee, hip, etc) until you detect forward falling"

so it also needs to have "thoughts" about sensor readings
and their relevance
humans got that too, you really don't care how itchy your shirt is when you're being shot at

feels like it might be wrong to make it one single function / decision maker

okokokok GREAT talk
but I realized the sort of thing I'm thinking of at the moment is actually a controller
and doesn't need intelligence or anything

so keeping this for next time I'm on a "makin a brain" roll

general summary:
* needs to formulate goals
* needs to do and learn from experiments (allows it to understand the difference between tripping itself and being blown over by wind)
* good memory is super helpful so it can revise experiments and conclusions
* it seems possibly useful to have it get bored / diminishing returns... not sure what end that's useful to but it's very human.