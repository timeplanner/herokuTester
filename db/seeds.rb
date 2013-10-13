# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



puts "********Seeding Data Start************"
users = [
    {
        name:"Ran",
        email:"1@1.com",
        password: "123123",
        password_confirmation: "123123"
    }
]

users.each do |user|
  admin = User.create!(user)
  admin.toggle!(:admin)
end

posts = [
    { location:"zhang jiakou",
      audio: "//www.recordmp3.org/fHEhI.mp3",
      video: "//www.youtube.com/embed/DSbtkLA3GrY",
      comment:"interesting hit pop!"
    }]

posts.each do |post|
  user_RanLi = User.find_by_name("Ran")
  user_RanLi.posts.create!(post)
end




puts "********Seeding Data End************"