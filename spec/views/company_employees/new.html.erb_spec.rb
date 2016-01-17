require 'rails_helper'

RSpec.describe "company_employees/new", type: :view do
  before(:each) do
    assign(:company_employee, CompanyEmployee.new(
      :user_id => "",
      :employee_id => 1
    ))
  end

  it "renders new company_employee form" do
    render

    assert_select "form[action=?][method=?]", company_employees_path, "post" do

      assert_select "input#company_employee_user_id[name=?]", "company_employee[user_id]"

      assert_select "input#company_employee_employee_id[name=?]", "company_employee[employee_id]"
    end
  end
end
