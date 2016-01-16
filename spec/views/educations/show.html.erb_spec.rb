require 'rails_helper'

RSpec.describe "educations/show", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :school => "School",
      :degree => "Degree",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/School/)
    expect(rendered).to match(/Degree/)
    expect(rendered).to match(/Date/)
  end
end
