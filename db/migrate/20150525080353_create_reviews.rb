class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :reviewpost
      t.integer :review_by
      t.integer :review_to

      t.timestamps
    end
  end
end
