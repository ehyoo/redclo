json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :upvotes
  json.url post_url(post, format: :json)
end
