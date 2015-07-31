json.array!(@plans) do |plan|
  json.extract! plan, :id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
  json.url plan_url(plan, format: :json)
end
