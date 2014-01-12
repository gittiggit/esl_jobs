task :vmi => :environment do
require 'nokogiri'
require 'open-uri'

  if 1==1
      url = "http://www.eslemployment.com/country/esl-jobs-Vietnam.html"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "8"
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

  if 3==3
      url = "http://www.eslemployment.com/country/esl-jobs-Mexico.html"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "9"
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


  if 4==4
      url = "http://www.eslemployment.com/country/esl-jobs-Italy.html"
      doc = Nokogiri::HTML(open(url))
      data = []
      doc.css("#joblist td:nth-child(1) a").first(5).each do |titlecss|
      country = "10"
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