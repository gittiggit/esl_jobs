task :parse_job => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://esljobs.herokuapp.com"
doc = Nokogiri::HTML(open(url))

data = []
doc.css("strong a").each do |titlecss|
doc.css("strong a").collect { |link| link['href']}.each do |linkcss|
  country = "1"
  jobtype = "1"
  urlnext = url+linkcss
  docnext = Nokogiri::HTML(open(urlnext))
  docnext.css("td").each do |detailscss|
#  linkcss = s.css("strong a").collect { |link| link['href']}
  data << JobPost.create(
   :title => titlecss.text,
    :jobslink => urlnext,
    :description => detailscss.text,
    :country_id => country,
    :job_type_id => jobtype
#    :description => linkcss
)
end
end
end
end