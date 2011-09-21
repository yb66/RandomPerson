=RandomPerson

A port to Ruby of Perl's Data::RandomPerson.

http://search.cpan.org/~peterhi/Data-RandomPerson-0.4/

Initially just the Names portion. In fact, probably just that. I'm not a masochist. Well, just a bit.

## Why did I write this?

Because the Faker library and a few of the other random ones are very good, but they don't have the precision I needed. I wanted believable male names between a certain age range for a football game I was writing. Producing names like Mrs Albert Wiggins wasn't really going to cut it.

And I'm a masochist.

It also has unicode characters, so it'll give your database a real test.


## Installation:

You'll need at least Ruby v1.9.1

Get the public key from http://github.com/yb66/RandomPerson/blob/master/gem-public_cert.pem and do:

  gem cert --add /path/to/wherever/you/downloaded/this/to/public_cert.pem
  
then install it:

  gem install randomperson -P HighSecurity
  

## USAGE:

So, to generate 1000 random people with Spanish names, between the ages of 16 and 35 with a ratio of 3 males to every 5 females:

  require 'randomperson'

  r = RandomPerson() # don't forget the brackets!
  
  r.demographic("Spain").add_Spanish( {gender_ratio: [3,5] , age_lower:16, age_upper:35 } )

  people = [ ]
  1000.times { people << r.generate }
  
  10.times { |i| puts "#{people[i].first} #{people[i].last} age: #{people[i].age} born: #{people[i].dob.strftime("%d-%b-%Y")}" }

  Bartolomé Andrés de Elixaeberna age: 20 born: 28-Apr-1990
  Fabiana Cordero Balmaceda age: 21 born: 14-Jun-1989
  Jorge Alas Albarracin age: 29 born: 16-Apr-1981
  Eufemia Berlanga de Sergi age: 33 born: 25-Jan-1977
  David Puig Villaroel age: 19 born: 17-Apr-1991
  Alba Henchoz de Hurtado age: 30 born: 14-Feb-1980
  Natalia Jara de Guevara age: 33 born: 28-Jul-1977
  Tito Cresaco Campo age: 20 born: 14-Feb-1990
  Susana Pitillas de Vaime age: 32 born: 12-Aug-1978
  Gustavo Hierro Carbajal y Plazas age: 31 born: 08-Feb-1979

Here's an example using the Thai Romanised data:

  r.demographic("Thai").add_Thai_Romanised 
  people = [ ]
  10.times { people << r.generate( "Thai") }
  10.times { |i| puts "#{people[i].first} #{people[i].last} age: #{people[i].age} born: #{people[i].dob.strftime("%d-%b-%Y")}" }
  
  Yongchaiyuth Sripituksakul Puntasrima age: 39 born: 29-Mar-1971
  Sri-Patana Wattanasin age: 77 born: 04-Feb-1933
  Wattana Rojjanasukchai age: 7 born: 27-Jun-2003
  Ban Sukbunsung age: 85 born: 07-Sep-1925
  Daeng Prasongsanti age: 65 born: 27-Mar-1945
  Proi Paowsong Sriwarunyu age: 60 born: 06-May-1950
  Ban Yongjaiyut age: 4 born: 06-Nov-2006
  Siam Narkhirunkanok age: 15 born: 12-Aug-1995
  Tong Punyawong Kadesadayurat age: 64 born: 01-Sep-1946
  Sarai Wattanapanit Maneerattana age: 44 born: 21-Dec-1966

## DEMOGRAPHIC

The Demographic class sets the parameters that will be used to generate people.

    r.demographic("My fancy demo")

is the same as

    r.demographic("My fancy demo", gender_ratio: [1,1] , age_lower: 0, age_upper: 115 )

So you'd end up with a population of roughly 50:50 male/female with ages from 0 to 115 years.

If you don't give a demographic name it will be given a number. To see the demographics use:

    r.demographics
    
To see a particular one, use its name (it's a hash):

    r.demographics["My fancy demo"]

## LOADING NAMEFILES

`r.demographic.add_Spanish_Female` would just load the SpanishFemaleFirst into r.demographics.
  
r.demographic.add_Spanish would load:

  SpanishFemaleFirst into choice.female
  SpanishMaleFirst into choice.male
  SpanishLast into choice.last

etc etc
  
or you can do things the old fashioned way

  require 'namefiles/spanishfemalefirst' #obviously you need to use the path from where you are or where the script will run from
  
  r.demographic["My fancy demo"].female = RandomPerson::SpanishFemaleFirst.new

The rule is, put_underscores_between_the_important_words

_and_

always begin with *add_*

_and_

make sure each word is capitalised, add\_male will actually pick up Fe_male_ whereas Female and Male will get what you want.

If you want EnglishLast names loaded:

    r.demographic.add_English_Last

All English files:

    r.demographic.add_English

English males:

  r.demographic.add_English_Male


If you need to check what's loaded, have a look in the instance variables of the demographic:

  r.demographic["Spanish"].male
  r.demographic["Spanish"].male.female
  r.demographic["Spanish"].male.last
  r.demographic["Spanish"].male.prefix
  r.demographic["Spanish"].male.suffix
  
## NEGATIONS

Sometimes you'll want to load something but not another, you can do this by prepending _not_ to the things you don't want. For example, to get the Thai names that are in Thai script and not romanised:

		# an already load demographic gets Thai
	  r.demographic["Thai"].male.add_Thai_notRomanised
  
or

		# a new demographic gets non romanised Thai and no female names
	  r.demographic("Thai").add_Thai_notRomanised_notFemale

to also get rid of the female names.
  
This is an experimental thing. Seems to work, but may change. You cannot do this (at the moment)

	  r.demographic.notRomanised_add_Thai
  
*Always begin with add_*

## RATIOS VS ODDS

The default gender ratio is 1:1. The male part is the left side (or Array#first), the female is the right side (or Array#last). All ratios are given as an array i.e. [1,1] or [3,2]

A ratio of 1:1 will not necessarily give you a population with exactly half male, half female. The ratio is the odds of getting that. So a ratio of [1,3] will give a 25% chance of producing a male and a 75% chance of being a female.

If you wish to have an exact ratio within the population then create two choices each with a 0% chance of producing the other. For example:

  men = RandomPerson::Choice.new( gender_ratio:[1,0] )
  women = RandomPerson::Choice.new( gender_ratio:[0,1] )
  ...more code here...
  g.make_generator men # pushes the generator onto @generators in 0 position
  g.make_generator women # pushes the generator onto @generators in 1 position
  25.times { people << g.generators[0].call }
  75.times { people << g.generators[1].call }

This would give you a population of 25 males and 75 females. Which sounds great unless you really think about it.

## FORMATTING

Each culture has it's own conventions around names. This makes sticking some monolithic algorithm in the centre of the code to sort out how names should be displayed impossible, so each data file describes how it thinks the names should be formatted.

For example, in the EnglishLast.rb file:

  @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled_hyphenated=> ->(n)   { n.rand + '-' + n.rand },
         }
       
This tells us that there are two ways of formatting last names defined in the file. All formats are described as lambda functions in a hash, the key being a description of what it's trying to achieve.

## BIT MORE ON RATIOS

Behind the scenes, ratios like this [1,3] are converted to an array of ranges like this [0..24, 25..99], called ratiod. Just so you know for this next bit.

In the EnglishLast.rb file:
  @formats_ratiod = [ (0..96), (97..99) ]

This says that the chances of a name being single barrelled is 97%, and double barrelled is 3%. I made up those figures from my own experience, but if you disagree with either the ratios or the formatting then you can change it. Either directly in the file or while running the code. It's your choice. Just make sure the numbers are right, length of arrays should be the same ( e.g. four formatting options should have a ratio with four parts like [a,b,c,d]) or it will break.

## PREFIXES AND SUFFIXES

Each generator starts by producing a person with a gender, an age and a date of birth. These are then passed on to the subsequent name portions so that a male always gets a male name and a male prefix (if you've specified a prefix file).

Suffix files will also (I hope) do a bit of checking at what's already been set, so you won't get Dr. Bobby Horliton PhD, as it should be either Dr. or PhD (apparently). Stuff like that should get caught.

## ADDING YOUR OWN NAMEFILES

My suggestion is to find the type of name that is closest (if you're looking for Spanishy names then look at the Spanish files as they'll have similar formatting rules there for free...) and copy and paste it in to a new one. It's easier that way.

These are current name files in the library:

AmericanFemaleFirst
AmericanLast
AmericanMaleFirst
AmericanPrefix
AmericanSuffix
AncientGreekFemaleFirst
AncientGreekLast
AncientGreekMaleFirst
AnyLast
BasqueFemaleFirst
BasqueLast
BasqueMaleFirst
BritishPrefix
BritishSuffix
EnglishFemaleFirst
EnglishLast
EnglishMaleFirst
EnglishPrefix
FinnishFemaleFirst
FinnishLast
FinnishMaleFirst
FinnishPrefix
FrenchFemaleFirst
FrenchLast
FrenchMaleFirst
GermanFemaleFirst
GermanLast
GermanMaleFirst
ScottishFemaleFirst
ScottishLast
ScottishMaleFirst
ScottishPrefix
SpanishFemaleFirst
SpanishLast
SpanishMaleFirst
SpanishPrefix
SwedishFemaleFirst
SwedishLast
SwedishMaleFirst
ThaiFemaleFirst
ThaiFirst
ThaiLast
ThaiMaleFirst
ThaiRomanisedFemaleFirst
ThaiRomanisedLast
ThaiRomanisedMaleFirst
WelshFemaleFirst
WelshLast
WelshMaleFirst
WelshPrefix


## ACCURACY OF NAMES AND RATIOS

I've taken bits and pieces from wherever I could get them, so if you see something is wrong then either let me know or produce a patch. I've no idea what the process is for that on GitHub but I'm sure there's a tutorial if you look for it. I'll also add you name to this readme, and worldly fame will be yours.

## TODO:

There's lots to do. Lot of repetition and ugly bits here and there, but it works so I'll get round to it when I can.

## THANKS GO TO

Peter Hickman for writing the original library in Perl that inspired this on in Ruby.

My good friends:
Johan Bergsten for helping me out with the Swedish names.
HALLOJULIA (hayl yeah!) for helping me with the German names.
Aino Rissanen for helping me with the Finnish names.
Fabiola Fernández Gutiérrez for help with the Spanish prefixes.

Special thanks to my agent, all the people at Marvel and DC for such fine comics, my wife and my mom for supporting me when no one else believed in me, but (sniff) most thanks goes to Noel Edmonds and Jeremy Kyle, for making daytime TV so creepy and inane that I rarely waste time watching it.

## THE END UNLESS YOU WANT TO READ THE LICENCE

*Iain Barnett*

## LICENCE:

It's an MIT Licence, I didn't take any code from the Perl one just names and a slight idea on how to structure things, so this ain't gonna be under the GPL. MIT is better anyway ;)

 Copyright (c) 2010 Iain Barnett

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

In other words, be good.











