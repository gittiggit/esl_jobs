task :japan_oceania => :environment do
require 'nokogiri'
require 'open-uri'

 if true
      url = "http://www.esljobfeed.com/feedviewer/japan"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".forum-listing a").first(5).each do |titlecss|
      country = "112"
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
  

  if true
      url = "http://www.eslemployment.com/country/esl-jobs-Japan.html"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "112"
      jobtype = "1"
      urlnext = titlecss.attr('href')
      docnext = Nokogiri::HTML(open(urlnext))
      docnext.css('#jobdescription div').remove
      docnext.css('#detailjob , #job-summary').each do |detailscss|
      docnext.css('#pagemsg h1').each do |titlenextcss|  
      data << JobPost.create(
        :title => titlenextcss.text,
        :jobslink => urlnext,
        :description => detailscss.inner_html,
        :country_id => country,
        :job_type_id => jobtype
       )
  end
  end
  end
  end

 if true
      url = "http://www.esljobfeed.com/feedviewer/oceania"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".forum-listing a").first(5).each do |titlecss|
      country = "251"
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
  

  if true
      url = "http://www.eslemployment.com/esl-jobs/oceania/"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "251"
      jobtype = "1"
      urlnext = titlecss.attr('href')
      docnext = Nokogiri::HTML(open(urlnext))
      docnext.css('#jobdescription div').remove
      docnext.css('#detailjob , #job-summary').each do |detailscss|
      docnext.css('#pagemsg h1').each do |titlenextcss|  
      data << JobPost.create(
        :title => titlenextcss.text,
        :jobslink => urlnext,
        :description => detailscss.inner_html,
        :country_id => country,
        :job_type_id => jobtype
       )
  end
  end
  end
  end

end