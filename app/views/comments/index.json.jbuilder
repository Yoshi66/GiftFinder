json.array!(@comments) do |comment|
  json.extract! comment, :id, :post, :url, :question
  json.url comment_url(comment, format: :json)
end
