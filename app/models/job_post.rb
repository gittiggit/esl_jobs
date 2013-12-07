class JobPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  def should_generate_new_friendly_id?
    new_record?
  end

  belongs_to :country
  belongs_to :job_type
  validates_uniqueness_of :title
                    
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
