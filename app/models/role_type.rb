class RoleType < ActiveRecord::Base
    has_many :users
end
