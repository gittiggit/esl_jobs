require 'rails_helper'

RSpec.describe "CompanyEmployees", type: :request do
  describe "GET /company_employees" do
    it "works! (now write some real specs)" do
      get company_employees_path
      expect(response).to have_http_status(200)
    end
  end
end
