json.array!(@experiences) do |experience|
  json.extract! experience, :id, :title, :company_name, :year_experiences, :job_details
  json.url experience_url(experience, format: :json)
end
