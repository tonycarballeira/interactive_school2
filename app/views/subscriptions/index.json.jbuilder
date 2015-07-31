json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :new, :user_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
  json.url subscription_url(subscription, format: :json)
end
