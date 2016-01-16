require 'rails_helper'

RSpec.describe "experiences/index", type: :view do
  before(:each) do
    assign(:experiences, [
      Experience.create!(
        :title => "Title",
        :company_name => "Company Name",
        :year_experiences => 1,
        :job_details => "MyText"
      ),
      Experience.create!(
        :title => "Title",
        :company_name => "Company Name",
        :year_experiences => 1,
        :job_details => "MyText"
      )
    ])
  end

  it "renders a list of experiences" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
