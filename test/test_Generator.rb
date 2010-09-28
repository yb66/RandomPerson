require 'test/unit'
require 'date'
require_relative '../lib/randomperson/ext/Date.rb'
require_relative '../lib/randomperson/Generator.rb'

require 'set'
require_relative '../lib/randomperson/ext/Set.rb'
require_relative '../lib/randomperson/ext/Enumerable.rb'
require_relative '../lib/randomperson/ext/Kernel.rb'
require_relative '../lib/randomperson/Name.rb'
require_relative '../lib/randomperson/Names/AmericanFemaleFirst.rb'
require_relative '../lib/randomperson/Names/AmericanMaleFirst.rb'
require_relative '../lib/randomperson/Names/AmericanLast.rb'
require_relative '../lib/randomperson/Names/BritishPrefix.rb'
require_relative '../lib/randomperson/Names/BritishSuffix.rb'
require_relative '../lib/randomperson/Choice.rb'

require_relative '../lib/randomperson/ext/Array.rb'
require_relative '../lib/randomperson/ext/Hash.rb'
require_relative '../lib/randomperson/Person.rb'


class TestTask < Test::Unit::TestCase

#   def setup
#     g = RandomPerson::Generator.new
#   end

  # def teardown
  # end
  


  def test_make_generator
    
    choice = RandomPerson::Choice.new
    choice.add_American
    choice.add_British
    
    g = RandomPerson::Generator.new
    
    assert g.generators.empty?
    
    g.make_generator choice
    
    assert_not_nil g.generators
    assert_equal 1, g.generators.length
    
    assert_instance_of RandomPerson::Person, g.generators[0].call
    
    people = [ ]
    
    10000.times { people << g.generators[0].call }
    
    assert_nil people.uniq!
    
  end

  def test_ratiod
    assert_kind_of Array, RandomPerson::Generator.ratiod( [1,1] ) 
    assert_kind_of Range, RandomPerson::Generator.ratiod([1,1]).first
    assert_equal 25, RandomPerson::Generator.ratiod([1,3]).first.end
  end

  def test_pick_gender
    assert_not_nil RandomPerson::Generator.pick_gender()
    assert_equal( RandomPerson::Generator.pick_gender([1,0]), 'm' )
    assert_equal( RandomPerson::Generator.pick_gender([0,1]), 'f' )
    
    assert_equal( RandomPerson::Generator.pick_gender([10,0]), 'm' )
    assert_equal( RandomPerson::Generator.pick_gender([0,10]), 'f' )
  end
  
  def test_reset
#     choice = RandomPerson::Choice.new
#     choice2 = RandomPerson::Choice.new
    g = RandomPerson::Generator.new
#     g.make_generator choice
#     g.make_generator choice2
#     assert_equal( 2, g.generators.length )
#     g.reset
#     assert_equal( 2, g.generators.length )
#     assert( g.generators.empty? )
  end
  
  def test_pick_age
    n = 2000
    while n > 0
      r1 = rand(100)
      r2 = rand(100) + r1
      age = RandomPerson::Generator.pick_age(r1, r2)
      assert_not_nil age 
      assert( r2 >= age && age >= r1, "age #{age} r1 #{r1} r2 #{r2}" ) 
      n = n - 1
    end
  end
  
  def test_pick_dob
    n = 1000
    while n > 0
      r1 = rand(100)
      dob = RandomPerson::Generator.pick_dob(r1)
      assert_not_nil dob 
      assert_kind_of Time, dob
      assert_equal Time.now.year - r1, dob.year
      n = n - 1
    end
  end
  
  
end