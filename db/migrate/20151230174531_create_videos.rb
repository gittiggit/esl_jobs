class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :video_url
      t.text :vid_description

      t.timestamps
    end
  end
end
