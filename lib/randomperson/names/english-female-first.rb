# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names
  
    class EnglishFemaleFirst < Name
    
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample },
         ]
        @formats_ratiod = [ (0..99) ]
        super
      end
  
      # @private            
      Names = %w{ Aimee Aleksandra Alice Alicia Allison Alyssa Amy Andrea Angel Angela Ann Anna Anne Annie Ashley Barbara Beatrice Beth Betty Brenda Brooke Candace Cara Caren Carol Caroline Carolyn Carrie Cassandra Catherine Charlotte Chrissy Christen Christina Christine Christy Claire Claudia Courtney Crystal Cynthia Dana Danielle Deanne Deborah Deirdre Denise Diane Dianne Dorothy Eileen Elena Elizabeth Emily Erica Erin Frances Gina Giulietta Heather Helen Jane Janet Janice Jenna Jennifer Jessica Joanna Joyce Julia Juliana Julie Justine Kara Karen Katharine Katherine Kathleen Kathryn Katrina Kelly Kerry Kim Kimberly Kristen Kristina Kristine Laura Laurel Lauren Laurie Leah Linda Lisa Lori Marcia Margaret Maria Marie Marina Marisa Martha Mary Maya Melanie Melissa Michelle Monica Nancy Natalie Nicole Nina Pamela Patricia Rachel Rebecca Renee Sandra Sara Sharon Sheri Shirley Sonia Stefanie Stephanie Susan Suzanne Sylvia Tamara Tara Tatiana Terri Theresa Tiffany Tracy Valerie Veronica Vicky Vivian Wendy }
    end    
  end
end
