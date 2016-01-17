require "rails_helper"

RSpec.describe CompanyEmployeesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/company_employees").to route_to("company_employees#index")
    end

    it "routes to #new" do
      expect(:get => "/company_employees/new").to route_to("company_employees#new")
    end

    it "routes to #show" do
      expect(:get => "/company_employees/1").to route_to("company_employees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/company_employees/1/edit").to route_to("company_employees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/company_employees").to route_to("company_employees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/company_employees/1").to route_to("company_employees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/company_employees/1").to route_to("company_employees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/company_employees/1").to route_to("company_employees#destroy", :id => "1")
    end

  end
end
