require 'open-uri'
require 'nokogiri'

url = 'http://www.yahoo.co.jp/'

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
p doc.title