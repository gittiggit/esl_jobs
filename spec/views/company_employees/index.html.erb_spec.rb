require 'rails_helper'

RSpec.describe "company_employees/index", type: :view do
  before(:each) do
    assign(:company_employees, [
      CompanyEmployee.create!(
        :user_id => "",
        :employee_id => 1
      ),
      CompanyEmployee.create!(
        :user_id => "",
        :employee_id => 1
      )
    ])
  end

  it "renders a list of company_employees" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
