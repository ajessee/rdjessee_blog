# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Andre Jessee",
             email: "andre.isaac.jessee@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

User.create!(name:  "David Jessee",
             email: "david.jessee@gmail.com",
             password:              "password",
             password_confirmation: "password")

User.create!(name:  "Don Jessee",
             email: "rdj@gmail.com",
             password:              "password",
             password_confirmation: "password")

User.create!(name:  "Catherine Sarwar",
             email: "catjessee@gmail.com",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
