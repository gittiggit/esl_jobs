require 'rails_helper'

RSpec.describe "role_types/new", type: :view do
  before(:each) do
    assign(:role_type, RoleType.new(
      :name => "MyString"
    ))
  end

  it "renders new role_type form" do
    render

    assert_select "form[action=?][method=?]", role_types_path, "post" do

      assert_select "input#role_type_name[name=?]", "role_type[name]"
    end
  end
end
