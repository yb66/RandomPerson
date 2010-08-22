# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{randomperson}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Iain Barnett"]
  s.cert_chain = ["/Users/iainuser/.ssh/gem-public_cert.pem"]
  s.date = %q{2010-08-22}
  s.description = %q{A gem for generating random persons}
  s.email = %q{iainspeed @nospam@ gmail.com}
  s.extra_rdoc_files = ["README", "lib/Choice.rb", "lib/CommonFormatsFirstName.rb", "lib/Generator.rb", "lib/NameFiles/AmericanLast.rb", "lib/NameFiles/AmericanMaleFirst.rb", "lib/NameFiles/AmericanSuffix.rb", "lib/NameFiles/AnyLast.rb", "lib/NameFiles/BasqueLast.rb", "lib/NameFiles/EnglishFemaleFirst.rb", "lib/NameFiles/EnglishLast.rb", "lib/NameFiles/EnglishPrefix.rb", "lib/NameFiles/EnglishSuffix.rb", "lib/NameFiles/SpanishFemaleFirst.rb", "lib/NameFiles/SpanishLast.rb", "lib/NameFiles/SpanishMaleFirst.rb", "lib/NameFiles/SwedishFemaleFirst.rb", "lib/NameFiles/SwedishLast.rb", "lib/NameFiles/SwedishMaleFirst.rb", "lib/NameFiles/ThaiFirst.rb", "lib/NameFiles/ThaiRomanisedFemaleFirst.rb", "lib/NameFiles/ThaiRomanisedLast.rb", "lib/NameFiles/ThaiRomanisedMaleFirst.rb", "lib/Names.rb", "lib/Person.rb", "lib/Ratio.rb", "lib/ext/Array.rb", "lib/ext/Date.rb", "lib/ext/Enumerable.rb", "lib/ext/Hash.rb", "lib/ext/Kernel.rb", "lib/ext/Set.rb", "lib/randomperson.rb"]
  s.files = ["Manifest", "README", "Rakefile", "gem-public_cert.pem", "lib/Choice.rb", "lib/CommonFormatsFirstName.rb", "lib/Generator.rb", "lib/NameFiles/AmericanLast.rb", "lib/NameFiles/AmericanMaleFirst.rb", "lib/NameFiles/AmericanSuffix.rb", "lib/NameFiles/AnyLast.rb", "lib/NameFiles/BasqueLast.rb", "lib/NameFiles/EnglishFemaleFirst.rb", "lib/NameFiles/EnglishLast.rb", "lib/NameFiles/EnglishPrefix.rb", "lib/NameFiles/EnglishSuffix.rb", "lib/NameFiles/SpanishFemaleFirst.rb", "lib/NameFiles/SpanishLast.rb", "lib/NameFiles/SpanishMaleFirst.rb", "lib/NameFiles/SwedishFemaleFirst.rb", "lib/NameFiles/SwedishLast.rb", "lib/NameFiles/SwedishMaleFirst.rb", "lib/NameFiles/ThaiFirst.rb", "lib/NameFiles/ThaiRomanisedFemaleFirst.rb", "lib/NameFiles/ThaiRomanisedLast.rb", "lib/NameFiles/ThaiRomanisedMaleFirst.rb", "lib/Names.rb", "lib/Person.rb", "lib/Ratio.rb", "lib/ext/Array.rb", "lib/ext/Date.rb", "lib/ext/Enumerable.rb", "lib/ext/Hash.rb", "lib/ext/Kernel.rb", "lib/ext/Set.rb", "lib/randomperson.rb", "randomperson.gemspec", "t/Generator.t"]
  s.homepage = %q{http://github.com/yb66/RandomPerson}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Randomperson", "--main", "README"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")
  s.rubyforge_project = %q{randomperson}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/iainuser/.ssh/gem-private_key.pem}
  s.summary = %q{A gem for generating random persons}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
