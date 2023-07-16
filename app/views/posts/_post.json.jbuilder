json.extract! post, :id, :title, :description, :place, :when_went, :created_at, :updated_at
json.url post_url(post, format: :json)
