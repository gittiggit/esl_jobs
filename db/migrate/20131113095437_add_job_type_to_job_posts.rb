class AddJobTypeToJobPosts < ActiveRecord::Migration
  def change
    add_reference :job_posts, :job_type, index: true
  end
end
