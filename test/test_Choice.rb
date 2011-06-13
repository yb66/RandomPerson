require 'test/unit'
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
require_relative '../lib/randomperson/choice.rb'



class TestTask < Test::Unit::TestCase
  
  def test_construction
    #default choice
    choice = RandomPerson::Choice.new
    assert_not_nil choice
    assert_equal [1,1] , choice.gender_ratio
    assert_equal 0, choice.age_lower
    assert_equal 100, choice.age_upper
    
    
    choice2 = RandomPerson::Choice.new( gender_ratio:[2,1] )
    assert_not_nil choice2
    assert_equal [2,1] , choice2.gender_ratio
    assert_equal 0, choice2.age_lower
    assert_equal 100, choice2.age_upper
    
    
    choice3 = RandomPerson::Choice.new( age_lower: 20 )
    assert_not_nil choice3
    assert_equal [1,1] , choice3.gender_ratio
    assert_equal 20, choice3.age_lower
    assert_equal 100, choice3.age_upper
    
    
    choice4 = RandomPerson::Choice.new( age_upper: 50 )
    assert_not_nil choice4
    assert_equal [1,1] , choice4.gender_ratio
    assert_equal 0, choice4.age_lower
    assert_equal 50, choice4.age_upper
    
    
    choice5 = RandomPerson::Choice.new( gender_ratio:[10,1], age_upper: 105 )
    assert_not_nil choice5
    assert_equal [10,1] , choice5.gender_ratio
    assert_equal 0, choice5.age_lower
    assert_equal 105, choice5.age_upper
  end
  
  def test_reset_names
    
    choice = RandomPerson::Choice.new
    choice.add_American
    choice.add_British
    
    assert_not_nil choice.malefirst
    assert_not_nil choice.femalefirst
    assert_not_nil choice.last
    assert_not_nil choice.prefix
    assert_not_nil choice.suffix
    
    choice.reset_names
    
    assert_nil choice.malefirst
    assert_nil choice.femalefirst
    assert_nil choice.last
    assert_nil choice.prefix
    assert_nil choice.suffix
   
  end

  #this is a test for method_missing add_NAME method
  def test_add_NAME
  
    choice = RandomPerson::Choice.new
    assert_nil choice.malefirst
    assert_nil choice.femalefirst
    assert_nil choice.last
    assert_nil choice.prefix
    assert_nil choice.suffix
    
    choice.add_American
    choice.add_British
    
    assert_not_nil choice.malefirst
    assert_not_nil choice.femalefirst
    assert_not_nil choice.last
    assert_not_nil choice.prefix
    assert_not_nil choice.suffix
    
    assert_instance_of RandomPerson::Names::AmericanMaleFirst, choice.malefirst
    assert_instance_of RandomPerson::Names::AmericanFemaleFirst, choice.femalefirst
    assert_instance_of RandomPerson::Names::AmericanLast, choice.last
    assert_instance_of RandomPerson::Names::BritishPrefix, choice.prefix
    assert_instance_of RandomPerson::Names::BritishSuffix, choice.suffix
  end
  
  def test_load_names
    choice = RandomPerson::Choice.new
    assert_not_nil choice.available_classes
    
    len = choice.available_classes.length
    
    
    assert_not_equal 0, len
    
    choice2 = RandomPerson::Choice.new( gender_ratio:[10,1], age_lower: 25, age_upper: 105 )
    
    assert_not_nil choice2.available_classes #just for the helluvit
    
    assert_equal len, choice.available_classes.length
    assert_equal len, choice2.available_classes.length
    
  end
  
  
  def test_reset_parameters
    choice = RandomPerson::Choice.new
    choice.reset_parameters
    
    assert_nil choice.gender_ratio
    assert_nil choice.age_lower
    assert_nil choice.age_upper
    
    
    choice2 = RandomPerson::Choice.new( gender_ratio:[10,1], age_lower: 25, age_upper: 105 )
    choice2.reset_parameters
    
    assert_nil choice2.gender_ratio
    assert_nil choice2.age_lower
    assert_nil choice2.age_upper
  end


end