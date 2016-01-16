class AddUserToExperiences < ActiveRecord::Migration
  def change
    add_reference :experiences, :user, index: true
  end
end
