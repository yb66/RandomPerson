# encoding: UTF-8

# uses the @on_execute block of the including class
module Outputter
  module ClassMethods
    
  end # ClassMethods
  
  module InstanceMethods
    def on_execute( &block )
      @on_execute = block
    end

    def execute( person=nil )
      @on_execute.call( person )
    end
    
    private 
    
#TODO rename this as other classes are using it too
    def for_prefixes( for_females, for_males, child_age_upper_bound=16, female_lower_bound=50, male_upper_bound=50 )
      
      ->(person){
        name = if person.age <= child_age_upper_bound
          person.gender == 'f' ? for_females : for_males
        else
          r = rand( male_upper_bound )
          r += female_lower_bound if person.gender == "f"
          @possibles.each_pair{|k,v| break v if k === r }
        end # if
    
        name
      }
    end # prefixes
    
    def for_standard
      ->(person=nil){
        f = if @formats.length > 1
          r = rand(@formats_ratiod.last.end + 1)
          @possibles.each_pair{|k,v| break v if k === r }
        else
          @possibles.first.last #throw away the key name
        end
        f.( @names )
      }
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
