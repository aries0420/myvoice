json.array!(@blogs) do |blog|
  json.extract! blog, :title, :post
  json.url blog_url(blog, format: :json)
end
