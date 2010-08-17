#!/usr/bin/env ruby -wKU

class Array

  def index_in_range( n )
    self.each_with_index do |x, i|
      return i if x === n
    end
    return nil
  end
  
  def rand
    self[Kernel.rand(length)]
  end
  
end