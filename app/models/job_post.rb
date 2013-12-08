class JobPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id, use: :history
  def should_generate_new_friendly_id?
    new_record?
  end

  belongs_to :country
  belongs_to :job_type
  validates_uniqueness_of :title
#  validates_length_of :description, :maximum => 5                  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
