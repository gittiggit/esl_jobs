class AddSlugToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :slug, :string
    add_index :job_posts, :slug
end
end