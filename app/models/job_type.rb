class JobType < ActiveRecord::Base
  has_many :job_posts
  def display_name
    type_title
  end
end
