require 'open-uri'
require 'nokogiri'

#class Scrap_Web
html = open("http://www.yahoo.co.jp/").read
    parsed_html = Nokogiri::HTML.parse(html)
    title = parsed_html.title
    p title
    #/////////////
    description = parsed_html.css("meta[name='description']")
    description.each do |f|
      #p 'iiiiiiiiiiiiiiiiiiiiiiii'
      p f.attributes['content'].value
    end
    #//////////////

    $i = 0
    $num = 9
    total_sum = 0
    while $i < $num do
        $i +=1
       url = "http://railscasts.com/?page=" + $i.to_s + "&type=free&view=list"
       cast = open(url).read
        cast1 = Nokogiri::HTML.parse(cast)
        minutes = cast1.css('.list > tr')
        minutes1 = minutes.xpath('//td[contains(text(), "minutes")]').text.delete('minutes')
        minutes2 = minutes1.gsub(" ", ",").split(',')
        sum = 0
        minutes2.each do |f|
          sum += f.to_i
        end
        p total_sum += sum
    end
    p a = total_sum / 60
    p a / 24.0
