require 'faker'
 
  10.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end

  3.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10),
     role:     'premium'
   )
   user.skip_confirmation!
   user.save!
 end

  admin = User.new(
     name:     'Admin User',
     email:    'admin@example.com',
     password: 'helloworld',
     role:     'admin'
   )
   admin.skip_confirmation!
   admin.save!


 moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 
 member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
  role: 'standard'
  )
 member.skip_confirmation!
 member.save!

 users = User.all

 30.times do
   Wiki.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
