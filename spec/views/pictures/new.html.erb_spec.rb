require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
    assign(:picture, Picture.new(
      :pic_url => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "textarea#picture_pic_url[name=?]", "picture[pic_url]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"
    end
  end
end
