#!/usr/bin/env ruby -wKU

#require all the scaffolding

HERE = File.dirname(__FILE__)

Dir.glob( File.join( HERE, 'ext', '*.rb' ) ).each do |file|
  require file
end

Dir.glob( File.join( HERE, '*.rb' ) ).each do |file|
  require file 
end
