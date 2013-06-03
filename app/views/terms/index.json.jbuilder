json.array!(@terms) do |term|
  json.extract! term, :question, :answer, :uuid
  json.url term_url(term, format: :json)
end
