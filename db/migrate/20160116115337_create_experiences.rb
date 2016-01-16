class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company_name
      t.integer :year_experiences
      t.text :job_details

      t.timestamps
    end
  end
end
