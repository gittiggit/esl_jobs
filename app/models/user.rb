class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  include Mailboxer::Models::Messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[business individual]
  
  extend FriendlyId
  friendly_id :username
  
  
  acts_as_messageable

  def mailboxer_name
    self.username
  end

  def mailboxer_email(object)
    self.email
  end
  
end
