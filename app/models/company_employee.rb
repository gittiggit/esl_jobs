class CompanyEmployee < ActiveRecord::Base
    validates :user_id, :presence => true
    validates :employee_id, :presence => true
end
