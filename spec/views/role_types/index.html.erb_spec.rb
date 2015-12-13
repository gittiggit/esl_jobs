require 'rails_helper'

RSpec.describe "role_types/index", type: :view do
  before(:each) do
    assign(:role_types, [
      RoleType.create!(
        :name => "Name"
      ),
      RoleType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of role_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
