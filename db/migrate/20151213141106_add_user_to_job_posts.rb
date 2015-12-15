class AddUserToJobPosts < ActiveRecord::Migration
  def change
    add_reference :job_posts, :user, index: true
  end
end
