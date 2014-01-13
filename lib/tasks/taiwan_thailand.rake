task :taiwan_thailand => :environment do
require 'nokogiri'
require 'open-uri'

  if 1==2
      url = "http://www.esljobfind.com/main_job_search_results.php?s_job_country=Taiwan"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".free_school a").first(5).each do |titlecss|
      country = "4"
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
  
  
  if 2==2
      url = "http://www.esljobfeed.com/feedviewer/taiwan"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".rss_item").first(5).each do |titlecss|
      country = "4"
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
  
    if 3==4
      url = "http://www.esljobfind.com/main_job_search_results.php?s_job_country=Thailand"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".free_school a").first(5).each do |titlecss|
      country = "5"
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
  
  
  if 4==4
      url = "http://www.esljobfeed.com/feedviewer/thailand"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css(".rss_item").first(5).each do |titlecss|
      country = "5"
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