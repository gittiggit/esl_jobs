json.array!(@company_employees) do |company_employee|
  json.extract! company_employee, :id, :user_id, :employee_id
  json.url company_employee_url(company_employee, format: :json)
end
