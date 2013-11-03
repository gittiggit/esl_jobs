class AddCountryToJobPosts < ActiveRecord::Migration
  def change
    add_reference :job_posts, :country, index: true
  end
end
