json.extract! post, :id, :id, :title, :body, :is_published, :published_date, :created_at, :updated_at
json.url post_url(post, format: :json)
