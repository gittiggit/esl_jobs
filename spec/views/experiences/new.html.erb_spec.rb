require 'rails_helper'

RSpec.describe "experiences/new", type: :view do
  before(:each) do
    assign(:experience, Experience.new(
      :title => "MyString",
      :company_name => "MyString",
      :year_experiences => 1,
      :job_details => "MyText"
    ))
  end

  it "renders new experience form" do
    render

    assert_select "form[action=?][method=?]", experiences_path, "post" do

      assert_select "input#experience_title[name=?]", "experience[title]"

      assert_select "input#experience_company_name[name=?]", "experience[company_name]"

      assert_select "input#experience_year_experiences[name=?]", "experience[year_experiences]"

      assert_select "textarea#experience_job_details[name=?]", "experience[job_details]"
    end
  end
end
