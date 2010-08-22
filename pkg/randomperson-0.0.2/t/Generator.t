#!/usr/bin/env ruby -wKU

require 'generator'
require 'test/unit'

class TestTask < Test::Unit::TestCase

#   def setup
# 
#   end

  # def teardown
  # end
   
#   def test_load_names
# #     assert_equal(@task1.from, 'iain')
# #     assert_kind_of(@task1.added, Time)
#     assert_equal
#   end

  def test_ratiod
    assert_kind_of( RandomPerson::Generator.ratiod( [1,1] ), Array )
    assert_kind_of( RandomPerson::Generator.ratiod([1,1]).first, Range )
    assert_equal( RandomPerson::Generator.ratiod([1,3]).first.end, 25 )
  end

  def test_pick_gender
    assert_not_nil RandomPerson::Generator.pick_gender()
    assert_equal( RandomPerson::Generator.pick_gender([1,0]), 'm' )
    assert_equal( RandomPerson::Generator.pick_gender([0,1]), 'f' )
    
    assert_equal( RandomPerson::Generator.pick_gender([10,0]), 'm' )
    assert_equal( RandomPerson::Generator.pick_gender([0,10]), 'f' )
  end
  
  def test_pick_age
    n = 1000
    while n > 0
      r1 = rand(100)
      r2 = rand(100) + r1
      age = RandomPerson::Generator.pick_age(r1, r2)
      assert_not_nil( age )
      assert( r1..r2, age )
      n = n - 1
    end
  end
  
  def test_pick_dob
    n = 1000
    while n > 0
      r1 = rand(100)
      dob = RandomPerson::Generator.pick_dob(r1)
      # assert_kind_of(dob, Time)
      # assert_not_nil( dob )
      # assert_equal( dob.year, Time.now.year - r1 )
      n = n - 1
    end
  end
  
#   def test_read_initialvalues_failure
# #     assert_not_equal(@task1.from , "jane")
# #     assert_not_nil(@task2.unique_id)
#   end
  
end