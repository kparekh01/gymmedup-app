json.array! @users.each do |user|
  json.id  user.id
  json.email  user.email
  json.first_name  user.first_name
  json.last_name  user.last_name
  json.user_name  user.user_name
  json.admin  user.admin
  json.bio  user.bio
  json.birth_date  user.birth_date
  json.gym_id  user.gym_id
  json.zip_code  user.zip_code
  json.photo  user.photo
end
