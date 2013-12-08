class ChangeDescriptionInJobPosts < ActiveRecord::Migration
  def self.up
    change_column :job_posts, :description, :mediumtext
  end
  
  def self.down
    change_column :job_posts, :description, :text
  end
end
