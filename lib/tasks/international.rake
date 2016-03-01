task :international => :environment do
require 'nokogiri'
require 'open-uri'

  if true
      url = "http://www.eslcafe.com/joblist/"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("dd strong a").first(5).each do |titlecss|
      country = "1"
      jobtype = "1"
      urlnext = titlecss.attr('href')
      docnext = Nokogiri::HTML(open(urlnext))
      docnext.css("blockquote").each do |detailscss|
      data << JobPost.create(
        :title => titlecss.text,
        :jobslink => urlnext,
        :description => detailscss.inner_html,
        :country_id => country,
        :job_type_id => jobtype
       )
  end
  end
  end

  if true
      url = "http://www.esljobfeed.com/feedviewer/other"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".forum-listing a").first(5).each do |titlecss|
      country = "1"
      jobtype = "1"
      urlnext = titlecss.attr('href')
      docnext = Nokogiri::HTML(open(urlnext))
      docnext.css(".ContentBlock div:nth-child(7) , div:nth-child(9) a").each do |detailscss|
      docnext.css("div:nth-child(5) a").each do |nextjoblink|
      data << JobPost.create(
      :title => titlecss.text,
      :jobslink => nextjoblink.attr('href'),
      :description => detailscss.inner_html,
      :country_id => country,
      :job_type_id => jobtype
      )
  end
  end
  end
  end
  
end