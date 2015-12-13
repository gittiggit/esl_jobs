require 'rails_helper'

RSpec.describe "role_types/edit", type: :view do
  before(:each) do
    @role_type = assign(:role_type, RoleType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit role_type form" do
    render

    assert_select "form[action=?][method=?]", role_type_path(@role_type), "post" do

      assert_select "input#role_type_name[name=?]", "role_type[name]"
    end
  end
end
