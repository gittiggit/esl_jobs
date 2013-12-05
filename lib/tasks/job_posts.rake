task :fetch_travel => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://esljobs.herokuapp.com/"
doc = Nokogiri::HTML(open(url))

data = []
doc.css("tr td").each do |s|

  titlecss = s.css("strong a").text
  linkcss = s.css("strong a").collect { |link| link['href']}
  data << JobPost.create(
    :title => titlecss,
    :description => linkcss
)
end
end
