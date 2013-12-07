task :fetch_travel => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://www.eslemployment.com/"
doc = Nokogiri::HTML(open(url))

data = []
doc.css(".jobpostrow-alternate td:nth-child(1) , .jobpostrow td:nth-child(1), .jobtitle").each do |s|

  titlecss = s.css(".jobtitle").text
  country = "1"
  jobtype = "1"
#  linkcss = s.css("strong a").collect { |link| link['href']}
  data << JobPost.create(
    :title => titlecss,
    :country_id => country,
    :job_type_id => jobtype
#    :description => linkcss
)
end
end