task :china => :environment do
require 'nokogiri'
require 'open-uri'

  if true
      url = "http://www.eslcafe.com/jobs/china"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("dd strong a").first(5).each do |titlecss|
      country = "3"
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
      url = "http://www.esljobfind.com/main_job_search_results.php?s_job_country=China"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".free_school a").first(5).each do |titlecss|
      country = "3"
      jobtype = "1"
      urlnext ="http://www.esljobfind.com" +titlecss.attr('href')
      docnext = Nokogiri::HTML(open(urlnext))
      docnext.css("tr:nth-child(8) .free_preview_data").each do |detailscss|
      docnext.css(".basic .basic tr:nth-child(2) .free_preview_data").each do |titlenextcss|
      data << JobPost.create(
        :title => titlenextcss.inner_html+", "+titlecss.text,
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
      url = "http://www.esljobfeed.com/feedviewer/china"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".forum-listing a").first(5).each do |titlecss|
      country = "3"
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
      url = "http://www.eslemployment.com/country/esl-jobs-China.html"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "3"
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