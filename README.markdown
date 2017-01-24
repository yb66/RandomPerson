# RandomPerson

A port to Ruby of Perl's Data::RandomPerson.

http://search.cpan.org/~peterhi/Data-RandomPerson-0.4/

## Build status ##

Master branch:  
[![Build Status for master branch](https://secure.travis-ci.org/yb66/RandomPerson.png?branch=master)](http://travis-ci.org/yb66/RandomPerson)

Development branch:  
[![Build Status for development branch](https://secure.travis-ci.org/yb66/RandomPerson.png?branch=develop)](http://travis-ci.org/yb66/RandomPerson)

## QUICK NOTE!

I'd really, *really* appreciate it that if you see something is wrong or doesn't work for you or you've an idea for improvement **let me know**. Wow, Github makes this so easy, just go for it! I'll be happy to help and happy for the help. Bonus points for a topic branch too!


## Why did I write this?

Because the Faker library and a few of the other random ones are excellent, but they don't have the precision I needed. I wanted believable male names between a certain age range for a football game I was writing. Producing names like Mrs Albert Wiggins wasn't really going to cut it.

And I'm a masochist.

It also has unicode characters, so it'll give your database a real test. At least, if it's MySQL, all the other databases won't even notice.


## Installation:

		gem install randomperson
		
## Super quick start! ##

For those with a short attention span:

		require 'randomperson'

		r = RandomPerson() # don't forget the brackets!
		r.generate  # => each time this will generate a new person.
		
The demographics will be randomly selected.

## USAGE: ##

For those with more willpower:

The original API (if you can call it that) was very clunky so I've endeavoured to improve it by adding a nice facade over the top. I'll start off using that but as the examples move along I might do some things "the old fashioned way" by using some of the classes underlying everything directly, just so you know what's going on under there. If you see several ways of doing the same thing don't freak out! You're probably best using the stuff just below here.

So, to generate 1000 random people with Spanish names, between the ages of 16 and 35 with a ratio of 3 males to every 5 females:

		require 'randomperson'

		r = RandomPerson() # don't forget the brackets!

		r.demographic("Spain", gender_ratio: [3,5] , age_lower:16, age_upper:35 ).add_Spanish

		people = [ ]
		1000.times { people << r.generate }

		10.times { |i| puts "#{people[i].first} #{people[i].last} age: #{people[i].age} born: #{people[i].dob.strftime("%d-%b-%Y")}" }

Output:  

>  Bartolomé Andrés de Elixaeberna age: 20 born: 28-Apr-1990  
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

Output:  
 
>  Yongchaiyuth Sripituksakul Puntasrima age: 39 born: 29-Mar-1971  
  Sri-Patana Wattanasin age: 77 born: 04-Feb-1933  
  Wattana Rojjanasukchai age: 7 born: 27-Jun-2003  
  Ban Sukbunsung age: 85 born: 07-Sep-1925  
  Daeng Prasongsanti age: 65 born: 27-Mar-1945  
  Proi Paowsong Sriwarunyu age: 60 born: 06-May-1950  
  Ban Yongjaiyut age: 4 born: 06-Nov-2006  
  Siam Narkhirunkanok age: 15 born: 12-Aug-1995  
  Tong Punyawong Kadesadayurat age: 64 born: 01-Sep-1946  
  Sarai Wattanapanit Maneerattana age: 44 born: 21-Dec-1966  

## DEMOGRAPHICS

The Demographic class sets the parameters that will be used to generate people.

    r.demographic("My fancy demo")

is the same as

    r.demographic("My fancy demo", gender_ratio: [1,1] , age_lower: 0, age_upper: 115 )

So you'd end up with a population of roughly 50:50 male/female with ages from 0 to 115 years.

If you don't give a demographic name it will be given a number. To see the demographics use:

    r.demographics
    
To see a particular one, use its name (it's a hash):

    r.demographics["My fancy demo"]
    
## LAST PERSON

    r.demographic("Who was last?").add_English
    r.person.lastname # generates a new person if none.
> => "Fletcher"

    r.person.lastname # gets the last person if there was one.
> => "Fletcher"

    r.generate.lastname # generates a new name every time
> => "Ford"
    
    r.person.lastname
> => "Ford"
    
    r.generate.lastname
> => "Bradley"

    r.generate.lastname
> => "King"

    r.person.lastname
> => "King"


    # an undefined demographic will return nil
    r.person("What?").lastname
> NoMethodError: undefined method `lastname' for nil:NilClass

    r.person("What?") 
> => nil

    r.person.lastname # it still remembers the last person.
> => "King"

    r.person("What?") 
> => nil

    r.person("Who was last?").lastname
> => "King"


    r.demographic("Not English").add_Thai
    r.person.lastname # not using Thais yet
> => "King"

    r.generate.lastname # generate will automatically assume you want to use the last loaded demographic, unless specified otherwise
> => "Ornlamai Sriwarunyu"

    r.generate("Who was last?").lastname # specify to the demographic to generate using it.
> => "Bradley-Adams"

    r.person.lastname
> => "Bradley-Adams"
    
    r.generate("Not English").lastname
> => "Suntornnitikul Parnthong"

    r.person("Who was last?").lastname # this will generate a new name due to the switch between demographics. It's only keeping one lastname, not a lastname for every demographic.
> => "Jones"

## WHY NAME THE DEMOGRAPHIC?

Because you can mix and match.


These will produce the same results (Spanish names), but are named differently.

    r.demographic("Spain").add_Spanish  
    r.demographics.keys
> => ["Spain"]


    r.demographic.add_Spanish # the name is handled for you.  
    r.demographics.keys
> => ["0"]

But, you can play about a bit with the name files. For example:

    r.demographic("Mix n match").add_Spanish  
    person = r.generate  
    puts "#{person.prefix if person.prefix} #{person.first} #{person.last} #{person.suffix if person.suffix}  age: #{person.age} born: #{person.dob.strftime("%d-%b-%Y")}"  
> => Sra. Enriqueta Sedeno Arbizu   age: 53 born: 22-Nov-1958

That is what we expect, but we can change the prefixes to British, the females' first names to be Finnish, and the males' first names to be French, while keeping the Spanish last names, and an American suffix for good measure!

    r.demographic("Mix n match").add_BritishPrefix.add_SpanishLast.add_FinnishFemaleFirst.add_FrenchMaleFirst.add_AmericanSuffix  
    person = r.generate  
    puts "#{person.prefix if person.prefix} #{person.first} #{person.last} #{person.suffix if person.suffix}  age: #{person.age} born: #{person.dob.strftime("%d-%b-%Y")}"  
> => Miss Johanna Sanchez Questi   age: 94 born: 20-May-1917

and the last 2 lines again:

> => Mr Rémy Escriba Sanroma   age: 103 born: 16-Mar-1908

or:

    r.demographic("French Spaniards").add_SpanishLast.add_French_First  
    person = r.generate # a couple of times and then puts...  
    
> => Denise-Juliette Parrado Heras   age: 80 born: 06-Apr-1931  
> => Gustav Cordona Belsue   age: 20 born: 27-Oct-1991


## LOADING NAMEFILES

`r.demographic.add_Spanish_Female` would just load the `SpanishFemaleFirst` class into `r.demographics`.
  
`r.demographic.add_Spanish` would load:

  `SpanishFemaleFirst` into `r.demographic["0"].femalefirst`  
  `SpanishMaleFirst` into `r.demographic["0"].malefirst`  
  `SpanishLast` into `r.demographic["0"].last`  

etc etc
  
or you can do things the old fashioned way (but why? anyway...)

		require 'namefiles/spanish-female-first'   
		# obviously you need to use the path from where you are 
		# or where the script will run from
  
		r.demographic["My fancy demo"].femalefirst = RandomPerson::Names::SpanishFemaleFirst.new

The rule is, put\_underscores\_between\_the\_important\_words

_and_

always begin with `add_`

_and_

make sure each word is capitalised, `add_male` will actually pick up Fe_male_ whereas `add_Female` and `add_Male` will get what you want.

If you want EnglishLast names loaded:

    r.demographic.add_English_Last

All English files:

    r.demographic.add_English

English males:

    r.demographic.add_English_Male


If you need to check what's loaded, use `loaded_classes`

		r.demographics["French"].loaded_classes

> # => {:femalefirst=>"French_Female_First", :last=>"French_Last", :malefirst=>"French_Male_First"}

Or, see all the demographics' loaded classes:

    r.demographics.loaded_classes
    
And (because I'm really lazy and like convenience), this does the same:

    r.loaded_classes


## NEGATIONS

Sometimes you'll want to load something but not another, you can do this by prepending _not_ to the things you don't want. For example, to get the Thai names that are in Thai script and not romanised:

		# an already load demographic gets Thai, non romanised
	  r.demographic["Thai"].male.add_Thai_notRomanised
  
or to also get rid of the female names.

		# a new demographic gets non romanised Thai and no female names
	  r.demographic("Thai").add_Thai_notRomanised_notFemale
  
This is an experimental thing. Seems to work, but may change. You cannot do this (at the moment)

	  r.demographic.notRomanised_add_Thai
  
**Always** *begin with* `add_`

Here's an example:

    r.demographic("SuperThai").add_Thai_notRomanised  
    people = [ ]  
    10.times { people << r.generate( "SuperThai") }  
    10.times { |i| puts "#{people[i].first} #{people[i].last} age: #{people[i].age} born: #{people[i].dob.strftime("%d-%b-%Y")}" }
    
Output:
    
> ทักษิณ ชัยภูมิ age: 53 born: 14-May-1958  
> สุริยา พิษณุโลก age: 47 born: 21-Aug-1964  
> แก้วเก้า เจริญปุระ age: 61 born: 14-Mar-1950  
> บัณฑิตา สระบุรี age: 113 born: 06-Nov-1898  
> วิศิษฏ์ สุโขทัย age: 83 born: 23-Sep-1928  
> สุประภา โลโซ age: 50 born: 09-Apr-1961  
> สริตา ตรัง age: 111 born: 27-Jan-1900  
> ณัฎฐา ลพบุรี age: 86 born: 24-Dec-1925  
> สุชาย ลพบุรี age: 88 born: 06-Apr-1923  
> ปราณี สะเมิง age: 85 born: 04-Mar-1926  
    

## RATIOS VS ODDS

The default gender ratio is 1:1. The male part is the left side (or Array#first), the female is the right side (or Array#last). All ratios are given as an array i.e. [1,1] or [3,2]

A ratio of 1:1 will not necessarily give you a population with exactly half male, half female. The ratio is the odds of getting that. So a ratio of [1,3] will give a 25% chance of producing a male and a 75% chance of being a female.

If you wish to have an exact ratio within the population then create two choices each with a 0% chance of producing the other. For example:

	  r.demographic("Men", gender_ratio:[1,0] )
	  r.demographic("Women", gender_ratio:[0,1] )
	  #...more code here...
	  
	  25.times { people << r.generate("Men") }
	  75.times { people << r.generate("Women") }

This would give you a population of 25 males and 75 females. Which sounds great unless you really think about it.

## FORMATTING

Each culture has it's own conventions around names. This makes sticking some monolithic algorithm in the centre of the code to sort out how names should be displayed impossible, so each data file describes how it thinks the names should be formatted.

For example, in the EnglishLast.rb file:

		@formats = [
		  ->(n)   { n.rand },
			->(n)   { n.rand + '-' + n.rand },
		]
       
This tells us that there are two ways of formatting last names defined in the file. All formats are described as lambda functions in an array.

## BIT MORE ON RATIOS

Behind the scenes, ratios like this [1,3] are converted to an array of ranges like this `[0..24, 25..99]`, called ratiod. Just so you know for this next bit.

In the EnglishLast.rb file:

    @formats_ratiod = [ 0..96, 97..99 ]

This says that the chances of a name being single barrelled is 97%, and double barrelled with a hypen is 3%. I made up those figures from my own experience, but if you disagree with either the ratios or the formatting then you can change it. Either directly in the file or while running the code. It's your choice. Just make sure the numbers are right, length of arrays should be the same ( e.g. four formatting options should have a ratio with four parts like [a,b,c,d]) or it will break.

## PREFIXES AND SUFFIXES

Each generator starts by producing a person with a gender, an age and a date of birth. These are then passed on to the subsequent name portions so that a male always gets a male name and a male prefix (if you've specified a prefix file).

Suffix files will also (I hope) do a bit of checking at what's already been set, so you won't get Dr. Bobby Horliton PhD, as it should be either Dr. or PhD (apparently). Stuff like that should get caught.

## ADDING YOUR OWN NAMEFILES

My suggestion is to find the type of name that is closest (if you're looking for Spanishy names then look at the Spanish files as they'll have similar formatting rules there for free...) and copy and paste it in to a new one. It's easier that way.

If you do make your own name file then fork this project and send me a pull request! (See the Github help if you don't know how).

These are current name files in the library:

American\_Female\_First  
American\_Last  
American\_Male\_First  
American\_Prefix  
American\_Suffix  
Ancient\_Greek\_Female\_First  
Ancient\_Greek\_Last  
Ancient\_Greek\_Male\_First  
Any\_Last  
Basque\_Female\_First  
Basque\_Last  
Basque\_Male\_First  
British\_Prefix  
British\_Suffix  
English\_Female\_First  
English\_Last  
English\_Male\_First  
English\_Prefix  
Finnish\_Female\_First  
Finnish\_Last  
Finnish\_Male\_First  
Finnish\_Prefix  
French\_Female\_First  
French\_Last  
French\_Male\_First  
German\_Female\_First  
German\_Last  
German\_Male\_First  
Scottish\_Female\_First  
Scottish\_Last  
Scottish\_Male\_First  
Scottish\_Prefix  
Spanish\_Female\_First  
Spanish\_Last  
Spanish\_Male\_First  
Spanish\_Prefix  
Swedish\_Female\_First  
Swedish\_Last  
Swedish\_Male\_First  
Thai\_Female\_First  
Thai\_First  
Thai\_Last  
Thai\_Male\_First  
Thai\_Romanised\_Female\_First  
Thai\_Romanised\_Last  
Thai\_Romanised\_Male\_First  
Welsh\_Female\_First  
Welsh\_Last  
Welsh\_Male\_First  
Welsh\_Prefix  


## ACCURACY OF NAMES AND RATIOS

I've taken bits and pieces from wherever I could get them, so if you see something is wrong then either let me know or produce a patch, just have a look at the help links on Github for how to do it. I'll also add you name to this readme, and worldly fame will be yours.

## PASS A BLOCK TO HANDLE ERRORS ##

If you try calling a demographic that doesn't exist yet, an error will be raised. There is a default handler for this, and it will output a warning, and the result returned will be nil. If you wish, you may supply a block to handle the error.

e.g.

    r.person # => this will produce a person, with a randomised demographic
    r.demographic("French").add_French 
    r.person # => this will produce a person too, with a French demographic
    r.person "French" # => French again
    
    # This raises an error, caught by the default block
    # which prints a warning to stdout
    r.person "British" # => That demographic does not exist!
    
    r.person "British" do |error|
      warn "There are no British people here, this is Scotland!"
    end
    # => "There are no British people here, this is Scotland!"
    
The default block can be set via:

    RandomPerson::Facade.default_error_block= #... put your block here, e.g
    RandomPerson::Facade.default_error_block= ->(error){ warn "-> #{error}" }

Or if you're lazy like me and have an instance floating around:

    r.class.default_error_block= ->(error){ warn "-> #{error}" }

## TODO:

There's lots to do. Lot of repetition and ugly bits here and there, but it works so I'll get round to it when I can.

## THANKS GO TO

Peter Hickman for writing the original library in Perl that inspired this on in Ruby.

My good friends:  
Johan Bergsten for helping me out with the Swedish names.  
HALLOJULIA (hayl yeah!) for helping me with the German names.  
Aino Rissanen for helping me with the Finnish names.  
Fabiola Fernández Gutiérrez for help with the Spanish prefixes.  
Aled Coe and Annette Smith for help with Welsh surnames.

Special thanks to my agent, all the people at Marvel and DC for such fine comics, my wife and my mom for supporting me when no one else believed in me, but (sniff) most thanks goes to Noel Edmonds and Jeremy Kyle, for making daytime TV so **creepy** and inane that I rarely waste time watching it.

## THE END UNLESS YOU WANT TO READ THE LICENCE

*Iain Barnett*

## LICENCE:

See the LICENCE file.

It's an MIT Licence, I didn't take any code from the Perl one just names and a slight idea on how to structure things, so this ain't gonna be under the GPL. MIT is better anyway ;)

Please, when using this code, be good.











