class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :jobslink
      t.string :salary
      t.string :company

      t.timestamps
    end
  end
end
