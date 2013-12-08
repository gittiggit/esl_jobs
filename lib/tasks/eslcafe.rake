task :eslcafe => :environment do

require 'nokogiri'
require 'open-uri'

url = "http://www.eslcafe.com/joblist/"
doc = Nokogiri::HTML(open(url))

data = []
#doc.css("strong a").each do |titlecss|

  doc.css("dd strong a").each do |titlecss|

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
    :description => detailscss.inner_html,
    :country_id => country,
    :job_type_id => jobtype
   
)

end
end
end