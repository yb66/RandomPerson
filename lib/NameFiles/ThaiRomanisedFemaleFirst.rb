#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class ThaiRomanisedFemaleFirst
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99)]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        f = @formats[:single]
      end
      Names.execute( NAMES, f )
    end 


    NAMES = %w{ abhasra achara adung anchali apsara ban banjit benjakalyani boon-nam boon-mee busaba butri cantana catchada chaiama chalermwan chanachai chandra chanhira chanthara chao-fa charanya chariya charoen charoenrasamee charunee chatmanee chatrsuda chatumas chaveevan chawiwan chintana chirawan choi chomechai chomesri chomsiri chuachan chuasiri chulaborn chumbot churai damni dao dhipyamongko dok dok-rak duan duang-prapha hansa jaidee jintana kaeo kalaya kamala kamchana kanchana kanita kannika kanya khae khun khunying kimnai klip kohsoom krijak kultilda kwaanfah kwanjai lalana lamai lamom lek lukden ma-dee mae mae-duna mae-khao mae-noi mae-pia mae-ying-thahan mai malee mali malivalaya maliwan manee mani manya-phathon maprang mekhala mekhalaa mekhla monthani naruemon ngam ngor nim nimnuan nittaya noi noklek noom pakpao petchra phak-phimonphan phan phara phi phim piam pichitra pitsamai prahong pranee prang praphat rajini ramphoei ratana rochana rutana saeng sangwan saowapa sarai sarakit savitree sawat simla sirikit sirindhorn somawadi son-klin songsuda sri-patana srinak srisuriyothai sua suchada sugunya sukanda sukonta sumalee sumana sunanda sunatda sunetra sunisa supaporn sureeporn talap tamarine thaksincha thao-ap thiang tida tookta tppiwan tui tuk tukata tulaya tum tuptim ubolratana um ung wani-ratana-kanya wipa wismita yaowalak yen ying yodmani }
    
    end
end