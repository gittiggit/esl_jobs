json.array!(@educations) do |education|
  json.extract! education, :id, :institute, :designation, :start, :end, :present, :description, :users_id
  json.url education_url(education, format: :json)
end
