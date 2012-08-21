module RandomPerson

  # @todo Spec
  class Set < ::Set

    # @todo handle failure
    # @return [Set] The set for which the pattern matches.
    def classify_true( pattern )
      self.classify{|s| true if s =~ %r{^.*/[^/]*#{pattern}[^/]*$}i }[true]
    end

  end
end