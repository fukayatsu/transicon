json.icons do
  json.array!(@icons) do |icon|
    json.id icon.id
    json.url icon.image.thumb.url
  end
end
