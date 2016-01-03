class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :businessname, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :about, :text
    add_column :users, :telephone, :string
    add_column :users, :website, :string
    add_column :users, :otherlocation, :string
    add_column :users, :citizenship, :string
    add_column :users, :birthdate, :date
    add_column :users, :introduction, :text
    add_column :users, :employees, :string
    add_column :users, :locationmap, :string
    add_column :users, :locationdescription, :text
    add_column :users, :skills, :string
    add_column :users, :language, :string
  end
end
