# encoding: UTF-8

require_relative "./ext/kernel.rb"


module RandomPerson
  
  # This module is here to do the loading of data into a demographic class
  # It relies on there being a self.available_classes method wrapped around a Set
  module Loader
  

    module ClassMethods
      
      
      def load_names( opts={} )
        opts = { patterns: ['*.rb'], lib_dir: File.dirname(__FILE__) }.merge( opts )
        
        fulls = opts[:patterns].map do |pattern|
          full_pattern = File.join( opts[:lib_dir], 'names', pattern )
        end
         Dir.glob( fulls )
      end
      

      # Requires the file and then returns the name of the class
      # @param [String] file_name The file to require and extract the class name from.
      # @return [String] The class name.
      def requiring( file_name )
        require file_name
        set_of_names = File.basename( file_name, ".rb" ).split("-").map(&:capitalize).join
      end
      
      def prefix_em( collection, prefix="RandomPerson::Names::" )
        collection.map{|x| "#{prefix}#{x}"}
      end
        
    
      
    end # ClassMethods
  
  
    module InstanceMethods
    
      # this adds the classes as constants
      # The patterns are there to stop other files being added by accident.
      # and to load the right names into the right instance var
      def addklass( klass, patterns=[["Male",'First'],["Female", "First"], ['Last'], ['Prefix'], ['Suffix']] )
      
        patterns.each do |ps|
          if ps.all?{|p| klass =~ /#{p}/ }
            instance_variable_set( "@#{ps.join.downcase}", eval("#{klass}.new") )
          end # if
        end
      end # addklass

    end # InstanceMethods
  
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end # Loader
  
end # RandomPerson
