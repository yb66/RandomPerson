# encoding: UTF-8

require_relative "./outputter.rb"


module RandomPerson

  # The base class for a name-data class.
  class Name
    include Outputter
    
    attr_accessor :formats, :formats_ratiod, :names, :possibles

    def initialize
      @possibles = Hash[ @formats_ratiod.zip @formats ] if @possibles.nil? unless @formats_ratiod.nil?
      
      @on_execute ||= for_standard
      
      @possibles    
    end
    

  
  end # class
  
end # RandomPerson
