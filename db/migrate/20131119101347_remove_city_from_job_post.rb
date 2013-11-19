class RemoveCityFromJobPost < ActiveRecord::Migration
  def change
    remove_column :job_posts, :city, :string
  end
end
