require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :video_url => "MyText",
      :vid_description => "MyText"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "textarea#video_video_url[name=?]", "video[video_url]"

      assert_select "textarea#video_vid_description[name=?]", "video[vid_description]"
    end
  end
end
