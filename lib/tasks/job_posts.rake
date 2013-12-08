task :parse_job => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://scrapper.mashpy.me/"
doc = Nokogiri::HTML(open(url))

data = []
#doc.css("strong a").each do |titlecss|

  doc.css("a:nth-child(1)").each do |titlecss|

  country = "1"
  jobtype = "1"
  urlnext = titlecss.attr('href')
  docnext = Nokogiri::HTML(open(urlnext))
  docnext.css("blockquote").each do |detailscss|
#  linkcss = s.css("strong a").collect { |link| link['href']}
  data << JobPost.create(
#   :description => titlecss.attr('href'),
    :title => titlecss.text,
    :jobslink => urlnext,
    :description => detailscss.text,
    :country_id => country,
    :job_type_id => jobtype
   
)

end
end
end