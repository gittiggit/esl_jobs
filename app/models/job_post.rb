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
  belongs_to :user
  validates_uniqueness_of :title
  validates :title, :city, :salary, :description, presence: true
  validates_length_of :description, :minimum => 50                  

  def self.search(search, countrysearch = nil)
    
    @countryid = Country.find_by(:countryname => countrysearch ) 
    
    if @countryid.blank?
        where('(title LIKE? OR description LIKE?)', "%#{search}%","%#{search}%")
    else
      where('(title LIKE? OR description LIKE?) AND country_id=?', "%#{search}%","%#{search}%", "#{@countryid.id }")
    end
  end
  
  def self.advancesearch(keyword = nil, countrysearch = nil, datesearch= nil)
    @countryid = Country.find_by(:countryname => countrysearch )
    where('(title LIKE? OR description LIKE?)', "%#{keyword}%","%#{keyword}%") if keyword.blank? 
    keywordsql= '(title LIKE\'%'+keyword+'%\' OR description LIKE\'%'+keyword+'%\')' unless keyword.blank?
    
    unless keyword.blank? || @countryid.blank?
    addand = ' AND '
    end
    
    unless keyword.blank? && @countryid.blank?
      unless datesearch.blank?
        dateand = ' AND '
      end
    end
    
    countrysql = addand.to_s + 'country_id ='+@countryid.id.to_s unless @countryid.blank?
    datesearch = dateand.to_s + '`created_at` BETWEEN \'' + datesearch.to_i.days.ago.to_s + '\' AND \'' + 0.days.ago.to_s + '\'' unless datesearch.blank?
    where(keywordsql.to_s+countrysql.to_s + datesearch.to_s)

  end

end
