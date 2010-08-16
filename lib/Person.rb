#!/usr/bin/env ruby -wKU

module RandomPerson
  class Person
  
    attr_accessor :gender, :age, :dob, :first, :last, :prefix, :suffix
    
    def initialize( h={} )
        @gender = h[:gender] || nil
        @age = h[:age] || nil
        @dob = h[:dob] || nil
        @first = h[:first] || nil
        @last = h[:last] || nil
        @prefix = h[:prefix] || nil
        @suffix = h[:suffix] || nil
    end
    
  end
end