json.array! @users do |user|
  json.username user.username
  json.list do 
    json.title user.list.title
    json.permissions user.list.permissions
  end
end
