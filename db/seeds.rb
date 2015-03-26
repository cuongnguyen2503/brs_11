# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = "abcd1234"

first_user = User.create!(name: "Noname", email: "no@email.com", password: password, password_confirmation: password)

2.upto(15) do |n|
  name = "User #{n}"
  email = "user-#{n}@server.com"
  user = User.create!(name: name, email: email, password: password, password_confirmation: password)

  Relationship.create!(followed: user, follower: first_user)

  Relationship.create!(followed: first_user, follower: user)
end
