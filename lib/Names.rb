#!/usr/bin/env ruby -wKU

module RandomPerson
  
  module Names
    
    FORMATS = {
      :single =>                      ->(n)   { n.rand },
      :double_barrelled =>            ->(n)   { n.rand + ' ' + n.rand }, 
      :double_barrelled_hyphenated=> ->(n)   { n.rand + '-' + n.rand },
     }
     
    def Names.execute( person, names, &format )
      format = FORMATS[:single] if format.nil?
      # puts format.inspect
      format.( names )
    end
    
    
    
    def self.formats
      FORMATS
    end
    
  end
end