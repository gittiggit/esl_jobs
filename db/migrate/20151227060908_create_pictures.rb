class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :pic_url
      t.text :description

      t.timestamps
    end
  end
end
