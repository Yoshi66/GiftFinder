json.array!(@demands) do |demand|
  json.extract! demand, :id, :country, :gender, :age, :price, :purpose, :type, :describe, :other
  json.url demand_url(demand, format: :json)
end
