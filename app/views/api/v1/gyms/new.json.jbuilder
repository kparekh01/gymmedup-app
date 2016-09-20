json.array! @gym.each do |gym|
  json.id gym.id
  json.name gym.name
  json.address gym.address
end
