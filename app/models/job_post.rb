class JobPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  def should_generate_new_friendly_id?
    new_record?
  end
  
  def normalize_friendly_id(string)
  super[0..80]
  end

  belongs_to :country
  belongs_to :job_type
  validates_uniqueness_of :title
#  validates_length_of :description, :maximum => 5                  

  def self.search(search, countrysearch = nil)
    
    @countryid = Country.find_by(:countryname => countrysearch ) 
    
    if @countryid.blank?
        where('(title LIKE? OR description LIKE?)', "%#{search}%","%#{search}%")
    else
      where('(title LIKE? OR description LIKE?) AND country_id=?', "%#{search}%","%#{search}%", "#{@countryid.id }")
    end
  end

end
