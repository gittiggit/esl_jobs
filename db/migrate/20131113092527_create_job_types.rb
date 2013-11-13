class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :type_title

      t.timestamps
    end
  end
end
