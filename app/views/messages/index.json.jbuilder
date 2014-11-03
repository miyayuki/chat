json.array!(@messages) do |message|
  json.extract! message, :id, :group_id, :user_id, :content, :created_id
  json.url message_url(message, format: :json)
end
