class Country < ActiveRecord::Base
  has_many :job_posts
   validates :countryname, presence: true,
                    length: { minimum: 3 }
  def display_name
    countryname
  end
end
