json.array! @lists do |list|
  json.title list.title
  json.permissions list.permissions
  json.items list.items, :subject, :state
end

