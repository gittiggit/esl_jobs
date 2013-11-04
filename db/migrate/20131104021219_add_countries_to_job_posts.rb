class AddCountriesToJobPosts < ActiveRecord::Migration
  def change
    add_reference :job_posts, :countries, index: true
  end
end
