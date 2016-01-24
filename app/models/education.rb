class Education < ActiveRecord::Base
    validates_presence_of :school, :degree, :date, :user_id
end
