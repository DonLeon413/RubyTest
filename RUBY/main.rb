require './agriculture_house_gov.rb'

puts "start parsing..."
result = AgricultureParser.Parse( 2106 )
puts "end parsing"

puts result;