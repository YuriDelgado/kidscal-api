# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.new()
  fname = Faker::Movies::StarWars.character.split(" ")
  user.profile.create({
    name: fname.first,
    last_name: fname.last,
    aka_name: Faker::Movies::StarWars.call_sign,
    gender: ['male', 'female'].sample
    })
end