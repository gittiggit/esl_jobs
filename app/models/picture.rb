class Picture < ActiveRecord::Base
     mount_uploader :pic_url, AvatarUploader
    belongs_to :user
    
    validate :avatar_size_validation
     private
  
  def avatar_size_validation
    errors[:pic_url] << "should be less than 1MB" if pic_url.size > 1.megabytes
  end
end
