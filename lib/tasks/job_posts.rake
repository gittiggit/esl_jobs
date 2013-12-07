task :parse_job => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://www.eslemployment.com/"
doc = Nokogiri::HTML(open(url))

data = []
doc.css(".jobtitle").each do |titlecss|
doc.css("#joblist td:nth-child(2) a").each do |detailscss|
  country = "1"
  jobtype = "1"
#  linkcss = s.css("strong a").collect { |link| link['href']}
  data << JobPost.create(
   :title => titlecss.text,
    :description => detailscss.text,
   
    :country_id => country,
    :job_type_id => jobtype
#    :description => linkcss
)
end
end
end