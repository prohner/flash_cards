json.array!(@subjects) do |subject|
  json.extract! subject, :subject_name, :uuid
  json.url subject_url(subject, format: :json)
end
