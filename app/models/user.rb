class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures
  belongs_to :role_type
  has_many :job_posts
  mount_uploader :avatar, AvatarUploader
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_uniqueness_of :username
  validates :first_name, :last_name ,presence: true
  include Mailboxer::Models::Messageable
  
  validates_uniqueness_of :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  ROLES = %w[business individual]
  
  extend FriendlyId
  friendly_id :username
  
  
  acts_as_messageable

  def mailboxer_name(object)
  
  end

  def mailboxer_email(object)
     
  end
  
  def self.teacher_search(keyword = nil, countrysearch = nil)

    if countrysearch.blank?
      where('(username LIKE? OR first_name LIKE?)', "%#{keyword}%","%#{keyword}%")
    else
      where('(username LIKE? OR first_name LIKE?) AND country=?', "%#{keyword}%","%#{keyword}%", "#{countrysearch }")
    end
  end
  
end
