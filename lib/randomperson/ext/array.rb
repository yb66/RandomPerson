# encoding: UTF-8

class Array

  # This will iterate over an array of ranges, and if the given n is in the range it will return the index for that range.
  def index_in_range( n )
    self.each_with_index do |x, i|
      return i if x === n
    end
    return nil
  end

  # This will randomly select one of the values from the array
  def rand
    self[Kernel.rand(length)]
  end
  
end
