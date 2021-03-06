# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "joyix",
            email: "joyix@163.com",
            password: "123456",
            password_confirmation: "123456",
            admin: true)

User.create!(name: "zuobian",
            email: "zuobian@163.com",
            password: "123456",
            password_confirmation: "123456")

User.create!(name: "joy",
            email: "joy@163.com",
            password: "123456",
            password_confirmation: "123456")

User.create!(name: "youbian",
             email: "youbian@163.com",
             password: "123456",
             password_confirmation: "123456")

users = User.all
user = User.first
following = users[2..4]
followers = users[2..4]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
