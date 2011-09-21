require "benchmark"

class Hash
  def by_index( n )
    self.each_with_index { |item, index| break item if index == n }
  end
end

class Array
  def index_in_range( n )
    self.each_with_index do |x, i|
      return i if x === n
    end
    return nil
  end
end

Times = 1000_000
Formats_ratiod = [ 0..23, 24..55, 56..74, 75..90, 91..96, 97..99 ]
Formats = Formats_ratiod.map{|x| x.to_s}

Current = Hash[ (1..Formats_ratiod.length).map{|x| x.to_s.to_sym}.zip Formats ]

Ranges = Hash[ Formats_ratiod.zip Formats ]

r = []
max = Formats_ratiod.last.end + 1
Times.times {|_| r << rand( max ) }

R = r
r = nil

def current( r )
  i = Formats_ratiod.index_in_range( r )
  f = Current.by_index(i).last
end

def array_contender( r )
  i = Formats_ratiod.index_in_range( r )
  f = Formats[i]
end

def hash_with_ranges_contender( r )
  f = Ranges.each_pair{|k,v| break v if k === r } 
end


Benchmark.bm do |b|  
  b.report( 'a ' ) do
    Times.times {|i| array_contender R[i] }
  end
  
  b.report( 'h ' ) do
    Times.times {|i| array_contender R[i] }
  end
  
  b.report( "c " ) do
    Times.times {|i| current R[i] }
  end
end