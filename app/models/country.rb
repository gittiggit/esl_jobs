class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :countryname, use: :history
  def should_generate_new_friendly_id?
    new_record?
  end
  
  has_many :job_posts
   validates :countryname, presence: true,
                    length: { minimum: 3 }
  def display_name
    countryname
  end
  

end