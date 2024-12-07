json.extract! item, :name, :body, :tag_list, :created_at, :updated_at
json.links do
  json.self do
    json.href item_url(item, format: :json)
  end
end
json.images item.images do |img|
  json.extract! img, :name, :status
  json.href img.image_url
end

attr = item.user_data
  if attr
    json.user_data do
    json.user User.current.username
    json.extract! attr, :own_count, :willtrade, :want, :hidden
    json.links do
      json.self do
        json.href user_item_url(attr, format: :json)
      end
    end
  end
end
