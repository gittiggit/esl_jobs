json.array!(@videos) do |video|
  json.extract! video, :id, :video_url, :vid_description
  json.url video_url(video, format: :json)
end
