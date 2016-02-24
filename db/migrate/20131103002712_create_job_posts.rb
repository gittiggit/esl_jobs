class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.text :title
      t.text :description
      t.string :city
      t.string :jobslink
      t.string :salary
      t.string :company
      t.text   :required_skills
      t.date   :expire_date
      t.timestamps
    end
  end
end
