json.array!(@links) do |link|
  json.extract! link, :id, :long_url, :short_url
  json.url link_url(link, format: :json)
end
