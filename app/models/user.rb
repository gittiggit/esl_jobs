class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Mailboxer::Models::Messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[employer employee]
  
  extend FriendlyId
  friendly_id :name
  
  
  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
  
end
