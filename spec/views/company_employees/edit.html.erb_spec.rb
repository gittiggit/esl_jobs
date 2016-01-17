require 'rails_helper'

RSpec.describe "company_employees/edit", type: :view do
  before(:each) do
    @company_employee = assign(:company_employee, CompanyEmployee.create!(
      :user_id => "",
      :employee_id => 1
    ))
  end

  it "renders the edit company_employee form" do
    render

    assert_select "form[action=?][method=?]", company_employee_path(@company_employee), "post" do

      assert_select "input#company_employee_user_id[name=?]", "company_employee[user_id]"

      assert_select "input#company_employee_employee_id[name=?]", "company_employee[employee_id]"
    end
  end
end
