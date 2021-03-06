# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Example User",
    email: "example@rails.org",
    password:              "foobar",
    password_confirmation: "foobar")

50.times do |n|
        name  = "TestUser-#{n+1}"
        email = "test-#{n+1}@railstutorial.org"
        password = "password"
        User.create!(name:  name,
                     email: email,
                     password:              password,
                     password_confirmation: password)
end

users = User.order(:created_at).take(6)
20.times do
  users.each { |user| user.tweets.create!(text: "#{Random.new(999).rand(1000)}--#{user.name}--#{user.email}") }
end


users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }