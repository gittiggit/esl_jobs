xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "ESL JOBS"
    xml.description "One stop gateway for esl jobs"
    xml.link job_posts_url(:rss)
	
    
for job_post in @job_posts
      xml.item do
        xml.title job_post.title
        xml.description raw(strip_tags(job_post.description)[0,450])
        xml.pubDate job_post.created_at.to_s(:rfc822)
        xml.link job_post_url(job_post)
        end
	end
  end
end