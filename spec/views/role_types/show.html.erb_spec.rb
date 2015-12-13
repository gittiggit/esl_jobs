require 'rails_helper'

RSpec.describe "role_types/show", type: :view do
  before(:each) do
    @role_type = assign(:role_type, RoleType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
