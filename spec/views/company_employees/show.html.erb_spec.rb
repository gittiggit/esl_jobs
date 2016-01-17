require 'rails_helper'

RSpec.describe "company_employees/show", type: :view do
  before(:each) do
    @company_employee = assign(:company_employee, CompanyEmployee.create!(
      :user_id => "",
      :employee_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
