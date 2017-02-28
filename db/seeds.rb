# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

andre = User.create!(name:  "Andre Jessee",
             email: "andre.isaac.jessee@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "David Jessee",
             email: "david.jessee@gmail.com",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Don Jessee",
             email: "rdj@gmail.com",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Catherine Sarwar",
             email: "catjessee@gmail.com",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

99.times do |n|
  title = Faker::Book.title
  content = Faker::Lorem.paragraphs(5)
  year = Faker::Number.between(1921, 2016)
  dec = Faker::Number.number(2)
  ager = Faker::Number.between(20, 93)
  thumb = Faker::LoremPixel.image
  cat = Faker::Color.color_name
  andre.stories.create!(title: title,
                        content: content,
                        year_written: year,
                        decade: dec,
                        age: ager,
                        thumbnail: thumb)

end

