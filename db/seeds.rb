# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

700.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = first_name[0] + last_name + "#{n+1}"
  email = "#{user_name}@gmail.com"
  password = "password"
  bio = Faker::Hipster.sentence(6)
  birth_date = Faker::Date.between(65.year.ago, 18.year.ago)

  test_user = User.create(
                first_name: first_name,
                last_name: last_name,
                user_name: user_name,
                birth_date: birth_date,
                bio: bio,
                email: email,
                password:              password,
                password_confirmation: password,
                )
          test_user.confirm
end
