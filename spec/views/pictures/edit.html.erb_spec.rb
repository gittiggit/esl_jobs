require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :pic_url => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "textarea#picture_pic_url[name=?]", "picture[pic_url]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"
    end
  end
end
