class Country < ActiveRecord::Base
has_many :job_posts, dependent: :destroy
end
