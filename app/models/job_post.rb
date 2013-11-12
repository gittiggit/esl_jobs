class JobPost < ActiveRecord::Base
  belongs_to :country
   validates :title, presence: true,
                    length: { minimum: 5 }
                    
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
