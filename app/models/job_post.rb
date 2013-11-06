class JobPost < ActiveRecord::Base
  belongs_to :country
   validates :title, presence: true,
                    length: { minimum: 5 }
end
