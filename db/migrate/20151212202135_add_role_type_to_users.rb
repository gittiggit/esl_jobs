class AddRoleTypeToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role_type, index: true
  end
end
