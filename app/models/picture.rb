class Picture < ActiveRecord::Base
     mount_uploader :pic_url, AvatarUploader
    belongs_to :user
end
