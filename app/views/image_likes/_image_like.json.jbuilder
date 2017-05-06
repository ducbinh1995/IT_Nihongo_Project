json.extract! image_like, :id, :user_id, :image_id, :created_at, :updated_at
json.url image_like_url(image_like, format: :json)
