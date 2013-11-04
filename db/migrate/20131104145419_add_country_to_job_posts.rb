class AddCountryToJobPosts < ActiveRecord::Migration
  def change
    add_reference :job_posts, :Country, index: true
  end
end
