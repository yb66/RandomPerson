module RandomPerson
  class Date < ::Date

    # Convenience function
    # @param [Integer] year
    # @param [Integer] month
    # @return [Integer] 
    def self.days_in_month( year, month ) 
      ::Date.civil(year, month, -1).day 
    end  

  end
end
