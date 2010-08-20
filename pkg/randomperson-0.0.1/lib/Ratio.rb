#!/usr/bin/env ruby -wKU

module RandomPerson #namespace

  module Ratio
  
    #create a ratio that is made up of ranges
    #to help hit with multiple valued ratios
    def rangio( ratio=[1,1] )
      sum = ratio.reduce(:+) #sum
      mult = 100.divmod( sum ).first #get a bigger spread of numbers
      ratio.map! { |n| n * mult }
      new_ratio = ratio.inject([0..0]) {|acc,n| acc + [acc.last.last ... (n + acc.last.last)] }
      new_ratio.shift #get rid of 0..0
      return new_ratio
    end 
    
    #find the order of magnitude of a number for use with this module
    def ordmag( n )
      m = 10
      while m < 1000
        break if n.divmod(m).first == 0
        m *= 10
      end
      m
    end
    
    #use this method if you don't have a ratio at all for an array and, hey presto! It'll make one for you
    def presto_rangio( len, mag )
      return [ ] unless len >= 1
      l, m = len, mag
      lower = 0
      presto = [ ]
      
      while l > 0
        # b = nil
        upper = m - l
        if l == 1
          b = upper
        else
          b = rand( upper - lower ) + lower
        end
        presto << (lower..b)   
        lower = b + 1
        l = l - 1
      end
      presto
    end
    
    
  end
  
end