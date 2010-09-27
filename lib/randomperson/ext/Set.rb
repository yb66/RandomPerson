class Set

  def classify_true( pattern )
    self.classify{ |s| true if s =~ /#{pattern}/ }[true]
  end
  
end