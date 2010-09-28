require 'test/unit'
require_relative '../lib/randomperson/Generator.rb'


class TestTask < Test::Unit::TestCase

#   def setup
#     g = RandomPerson::Generator.new
#   end

  # def teardown
  # end
  
#   def test_return_person
#     choice = RandomPerson::Choice.new( {gender_ratio: [3,5] , age_lower:16, age_upper:35 } )

#     choice.add_English
#     
#     g = RandomPerson::Generator.new
#     
#     g.make_generator choice
#     
#     people = [ ]
#   end


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
  
#   def test_pick_dob
#     assert(true)
#   end
#     n = 1000
#     while n > 0
#       r1 = rand(100)
#       dob = RandomPerson::Generator.pick_dob(r1)
#       # assert_kind_of(dob, Time)
#       # assert_not_nil( dob )
#       # assert_equal( dob.year, Time.now.year - r1 )
#       n = n - 1
#     end
#   end
  
#   def test_read_initialvalues_failure
# #     assert_not_equal(@task1.from , "jane")
# #     assert_not_nil(@task2.unique_id)
#   end
  
end