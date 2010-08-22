#!/usr/bin/env ruby -wKU

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end
