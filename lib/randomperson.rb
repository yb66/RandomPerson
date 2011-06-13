# encoding: UTF-8
module RandomPerson

  #require all the scaffolding
  
  require 'set'
  require 'date'
  
  require_relative './randomperson/ext/Array.rb'
  require_relative './randomperson/ext/Date.rb'
  require_relative './randomperson/ext/Enumerable.rb'
  require_relative './randomperson/ext/Hash.rb'
  require_relative './randomperson/ext/Kernel.rb'
  require_relative './randomperson/ext/Set.rb'
  
  require_relative './randomperson/choice.rb'
  require_relative './randomperson/generator.rb'
  require_relative './randomperson/name.rb'
  require_relative './randomperson/person.rb'
  #require_relative './randomperson/ratio.rb'

end