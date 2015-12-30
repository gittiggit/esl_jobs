require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :video_url => "MyText",
      :vid_description => "MyText"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "textarea#video_video_url[name=?]", "video[video_url]"

      assert_select "textarea#video_vid_description[name=?]", "video[vid_description]"
    end
  end
end
