module RandomPerson
  
  module Names

    def Names.execute( names, format=nil )
      format = ->(n){ n.rand } if format.nil?
      # puts format.inspect
      format.( names )
    end
    
  end
end