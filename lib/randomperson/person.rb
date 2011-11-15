module RandomPerson
  
  # Your general person
  class Person
  
    attr_accessor :gender, :age, :dob, :first, :last, :prefix, :suffix
    
    alias :lastname :last
    
    ## @param [optional,Hash] h A hash of the person's attributes
    # @option h [String] :gender nil Gender, 'm' for male or 'f' for female
    # @option h [Integer] :age nil Age
    # @option h [Time] :dob nil Date of birth
    # @option h [String] :first nil First name
    # @option h [String] :last nil Last name
    # @option h [String] :prefix nil Prefix e.g. Mr
    # @option h [String] :suffix nil Suffix e.g. PhD
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