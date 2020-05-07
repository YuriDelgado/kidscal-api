# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  fak = Faker::Movies::StarWars
  email = "#{fak.call_squadron}.#{fak.call_number}@#{fak.planet}.net"
  user = User.new({email: email, password: "starwars"})
  user.save
  fname = fak.character.split(" ")
  Profile.new({
    name: fname.first,
    last_name: fname.last,
    aka_name: fak.call_sign,
    gender: ['male', 'female'].sample,
    cellphone: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    description: fak.wookiee_sentence,
    user: user
  }).save
end