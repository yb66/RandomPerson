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


      # Changes the file name into a string useable as a constant class name
      def translate( file_name, prefix="RandomPerson::Names::" )
        "#{prefix}#{File.basename( file_name, ".rb" ).split("-").map(&:capitalize).join}"
      end
        
    
      
    end # ClassMethods
  
  
    module InstanceMethods

      # The patterns are there to stop other files being added by accident.
      # and to load the right names into the right instance var
      # @todo remove evil
      # @param [#to_constant] klass
      def addklass( klass, patterns=[["Male",'First'],["Female", "First"], ['Last'], ['Prefix'], ['Suffix']] )
      
        patterns.each do |ps|
          if ps.all?{|p| klass =~ /#{p}/ }
            instance_variable_set( "@#{ps.join.downcase}", klass.to_constant.new)
            instance_variable_get( :@loaded_classes ).store ps.join.downcase.to_sym, klass.to_s.split("::").last.scan( /([A-Z][a-z]+)/ ).flatten.join("_")
          end # if
        end
        klass
      end # addklass

    end # InstanceMethods
  
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end # Loader
  
end # RandomPerson
