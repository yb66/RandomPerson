#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class EnglishFemaleFirst
    include Names

    def execute( person, format=nil )
      Names.execute( NAMES )
    end 

    # def names( ) NAMES; end
      
    NAMES = %w{ aimee aleksandra alice alicia allison alyssa amy andrea angel angela ann anna anne annie ashley barbara beatrice beth betty brenda brooke candace cara caren carol caroline carolyn carrie cassandra catherine charlotte chrissy christen christina christine christy claire claudia courtney crystal cynthia dana danielle deanne deborah deirdre denise diane dianne dorothy eileen elena elizabeth emily erica erin frances gina giulietta heather helen jane janet janice jenna jennifer jessica joanna joyce julia juliana julie justine kara karen katharine katherine kathleen kathryn katrina kelly kerry kim kimberly kristen kristina kristine laura laurel lauren laurie leah linda lisa lori marcia margaret maria marie marina marisa martha mary maya melanie melissa michelle monica nancy natalie nicole nina pamela patricia rachel rebecca renee sandra sara sharon sheri shirley sonia stefanie stephanie susan suzanne sylvia tamara tara tatiana terri theresa tiffany tracy valerie veronica vicky vivian wendy }
  end
end