json.array!(@pictures) do |picture|
  json.extract! picture, :id, :pic_url, :description
  json.url picture_url(picture, format: :json)
end
