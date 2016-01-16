class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :date

      t.timestamps
    end
  end
end
