require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(
        :school => "School",
        :degree => "Degree",
        :date => "Date"
      ),
      Education.create!(
        :school => "School",
        :degree => "Degree",
        :date => "Date"
      )
    ])
  end

  it "renders a list of educations" do
    render
    assert_select "tr>td", :text => "School".to_s, :count => 2
    assert_select "tr>td", :text => "Degree".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
