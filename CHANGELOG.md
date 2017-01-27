v 1.4.0 Friday the 27th of January 2017

* Moved officially to >= Ruby v2.0.0
* Fixed the specs to work with RSpec 3.5 and thus Travis.
* Added a lot more yard docs.
* Removed the monkey patches.
* Pruned a few internals here and there.

----

v.1.3.1 Tuesday the 24th of January 2017

* Moved the licence file to its own file for clarity. Thanks to Chad Perrin for asking for this, it was definitely needed.

----

v1.3.0 Tuesday the 11th of September 2012

* Quicker to get data out if you're not bothered about the demographic make up.
* Better error handling.
* Much easier to find out which name classes have been loaded.

----

v1.2.0 Wednesday the 22nd of August 2012

* Removed the evil evals.
* Simplified some of the code.

----

v1.1.1 Tuesday the 21st of August 2012

* Removed some monkey patches.
* Added more docs to the code and added Yardoc support.
* Renamed all the files to use lowercase, and be split by hyphens.
* Travis-ci support added.
* Tightened some of the specs, added others.
* Updated README for all the above.

----

v1.0.0 Lots of breaking changes to API. Lots more specs, for code and namefiles. Some general cleaning of data too.

v0.0.19 Start of some specs.

v0.0.18 Improved documentation a bit. Changed some filenames to fix a problem with case sensitivity on some systems.

v0.0.17 Added Spanish prefixes. Improved ratios for prefixes to make chance of Dr equal between genders.

v0.0.16 Added English, Scottish and Welsh prefixes for convenience.

v0.0.15 Bugfix: prefix and suffix should now work. Finnish names have utf8 sign so should work. Added utf8 to all Name files, just in case. Fixed some nasty copy and paste errors with prefixes.

v0.0.14 Added Finnish prefixes.

v0.0.13 Added American prefixes. Altered British prefix ratios to be more realistic, and removed the dot, that's not supposed to be there! (you learn something new every day:)

v0.0.12 Added Finnish names.

v0.0.11 Added German names.

v0.0.10 Improved test coverage, very small tweaks to code to comply better with tests.

v0.0.9 Added particle formats for French last names.

v0.0.8 Added French names. Added Thai script names, unfortunately the last names are places as couldn't get a proper list. Added a negation for the add_ method, see README

v0.0.7  All Basque names added.

v0.0.6 Added ancient Greek names. Improved default method call for formats.

v0.0.5 Moved into new dir structure to avoid filename collisions in LOAD_PATH. Greatly improved American names.

v0.0.4 Removed shebangs and requires that were causing warnings. Added reset methods to Choice.

v0.0.3. Fixed some silly bugs within NameFiles

v0.0.2. Added support for Welsh, Scottish and Swedish names
