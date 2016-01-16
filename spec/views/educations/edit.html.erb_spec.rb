require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :school => "MyString",
      :degree => "MyString",
      :date => "MyString"
    ))
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do

      assert_select "input#education_school[name=?]", "education[school]"

      assert_select "input#education_degree[name=?]", "education[degree]"

      assert_select "input#education_date[name=?]", "education[date]"
    end
  end
end
