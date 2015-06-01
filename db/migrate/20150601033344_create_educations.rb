class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institute
      t.string :designation
      t.date :start
      t.date :end
      t.integer :present
      t.text :description
      t.integer :users_id

      t.timestamps
    end
  end
end
