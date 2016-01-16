require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new(
      :school => "MyString",
      :degree => "MyString",
      :date => "MyString"
    ))
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do

      assert_select "input#education_school[name=?]", "education[school]"

      assert_select "input#education_degree[name=?]", "education[degree]"

      assert_select "input#education_date[name=?]", "education[date]"
    end
  end
end
