require 'rails_helper'

RSpec.describe "experiences/show", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      :title => "Title",
      :company_name => "Company Name",
      :year_experiences => 1,
      :job_details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
