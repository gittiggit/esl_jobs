class AddUserToEducations < ActiveRecord::Migration
  def change
    add_reference :educations, :user, index: true
  end
end
