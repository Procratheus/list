json.array! @users do | user |
  json.username user.username
  json.list user.lists do |list|
    json.title list.title
    json.permissions list.permissions
  end

end
