json.array! @items do |item|
  json.subject item.subject
  json.state item.state
end