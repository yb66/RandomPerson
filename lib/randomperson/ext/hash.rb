class Hash
  def by_index( n )
    self.each_with_index { |item, index| break item if index == n }
  end
end
  
