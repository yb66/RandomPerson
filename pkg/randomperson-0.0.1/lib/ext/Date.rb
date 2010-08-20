#!/usr/bin/env ruby -wKU

require 'date'

class Date 
  def Date.days_in_month( year, month ) 
    Date.civil(year, month, -1).day 
  end  
end

