# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar123",
             password_confirmation: "foobar123",
             admin: true)

password = "abcd1234"

first_user = User.create!(name: "Noname", email: "no@email.com", password: password, password_confirmation: password)

2.upto(15) do |n|
  name = "User #{n}"
  email = "user-#{n}@server.com"
  user = User.create!(name: name, email: email, password: password, password_confirmation: password)

  Relationship.create!(followed: user, follower: first_user)

  Relationship.create!(followed: first_user, follower: user)
end

for i in 1..5
  category = Category.create!(name: "category" + i.to_s)
  for j in 1..15
    category.books.create!(title: "title" + j.to_s, publish_date: nil, author: "author" + i.to_s, number_of_page: i*j)
  end
end
