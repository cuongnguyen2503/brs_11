# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Rails.application.routes.url_helpers

password = "abcd1234"

first_user = User.create!(name: "Noname", email: "no@email.com", password: password, password_confirmation: password)

2.upto(15) do |n|
  name = "User #{n}"
  email = "user-#{n}@server.com"
  user = User.create!(name: name, email: email, password: password, password_confirmation: password)

  Relationship.create!(followed: user, follower: first_user)

  Relationship.create!(followed: first_user, follower: user)
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar123",
             password_confirmation: "foobar123",
             admin: true)

for i in 1..5
  category = Category.create!(name: "category" + i.to_s)
  for j in 1..15
    category.books.create!(title: "title" + j.to_s, publish_date: nil, author: "author" + i.to_s, number_of_page: i*j)
  end
end

2.upto(15) do |n|
  user = User.find_by id: n
  href = user_path user
  content = "#{first_user.name} follow <a class='activity-content-link' href='#{href}'>#{user.name}</a>"
  Activity.create!(user: first_user, content: content)
end

activity = Activity.find_by id: 1
2.upto(4) do |n|
  Like.create!(user_id: n, activity: activity)
end

user2 = User.find_by id: 2
user3 = User.find_by id: 3
Relationship.create!(followed: user2, follower: user3)
Relationship.create!(followed: user3, follower: user2)
href = user_path user3
content = "#{user2.name} follow <a class='activity-content-link' href='#{href}'>#{user3.name}</a>"
Activity.create!(user: user2, content: content)
href = user_path user2
content = "#{user3.name} follow <a class='activity-content-link' href='#{href}'>#{user2.name}</a>"
Activity.create!(user: user3, content: content)

Request.create!(user: first_user, title: "Request 1", content: "abcd 123456", solve: "solved")
Request.create!(user: first_user, title: "Request 2", content: "Can you gimme this book?")
Request.create!(user: user2, title: "Request 3", content: "New book pls", solve: "solved")
Request.create!(user: user2, title: "Request 4", content: "Pls add this book")