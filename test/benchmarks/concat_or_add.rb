require "benchmark"
require_relative "../lib/randomperson/Names/SpanishLast.rb"

S = RandomPerson::Names::SpanishLast.new

Benchmark.bm do |b|
  b.report( "+  " ) do
    a = ""
    1_000_000.times { 
      S.names.rand + 
      ' ' +
      S.names.rand  
    }
  end
    
  b.report( '#{}' ) do
    a = ""
    1_000_000.times { 
      "#{S.names.rand} #{S.names.rand}"
    }
  end

# this was just too slow    
#  b.report( "concat " ) do
#    a = ""
#    1_000_000.times { 
#      S.names.rand.concat(' ').concat( S.names.rand )
#    }
#  end
end