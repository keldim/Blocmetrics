# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
   User.create!(
   email:    Faker::Internet.unique.email,
   password: Faker::Internet.unique.password(8)
   )
 end

users = User.all

 5.times do
    Application.create!(
    name:    Faker::Company.unique.name,
    url: Faker::Internet.unique.url,
    user: users.sample
    )
  end

applications = Application.all

  20.times do
     Event.create!(
     name:    Faker::Company.unique.name,
     application: applications.sample
     )
   end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"
