require 'open-uri'
require 'nokogiri'


url = 'http://www.nytimes.com/'

doc = Nokogiri::HTML.parse(open(url))

doc.css('h2 > svg > image').each do |h2|
  puts h2['src']
end
