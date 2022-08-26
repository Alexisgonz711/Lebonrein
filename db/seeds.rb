# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Review.destroy_all
Booking.destroy_all
Organ.destroy_all
User.destroy_all

# For Users Creation

puts "Destroying users..."
puts "Creating users..."
elea = User.create!(email: "elea@hotmail.com", password: "secret", username: "Elea")
alexis = User.create!(email: "alexis@hotmail.com", password: "secret", username: "Alexis")
sherazade = User.create!(email: "sherazade@hotmail.com", password: "secret", username: "Sherazade")

fake_names = []
60.times do
  new_username = Faker::Games::LeagueOfLegends.champion
  fake_names << new_username if fake_names.include?(new_username) == false
end

fake_users = []
id_user = 0

30.times do
  fake_users << User.create!(email: "#{fake_names[id_user]}@hotmail.com".delete(" "), password: "secret", username: fake_names[id_user])
  id_user += 1
end

puts "#{User.count} users created!"

# For Organs Creation

puts "Destroying organs..."
puts "Creating organs..."

jeune = Organ.create!(name: "Coeur d'un jeune", category: "Coeur", pricing: 22000,  description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500", user: sherazade )
poumon = Organ.create!(name: "Je vends mon poumon", category: "poumon", description: "neuf", user: elea, pricing: 10000)
coeur = Organ.create!(name: "Je vends un coeur trouvé dans une poubelle", category: "coeur", description: "un peu amoché", user: alexis, pricing: 20000)

categories = ["poumon", "coeur", "rein", "foie", "rate", "estomac", "intestin", "penis", "clitoris", "vessie", "pancréas", "apendice", "vésicule billiaire"]

new_sherazade_organs = []

5.times do
  new_sherazade_organs << categories.sample
end

id_sherazade = 0

5.times do
  organ = Organ.new(name: "À vendre, #{new_sherazade_organs[id_sherazade]} !", category: new_sherazade_organs[id_sherazade], description: Faker::Games::LeagueOfLegends.quote, user: sherazade, pricing: (10000..100000).to_a.sample)
  organ.save!
  Review.create(comment: Faker::TvShows::GameOfThrones.quote, rating: rand(0..5), organ: organ)
  id_sherazade += 1
end

new_organs = []

57.times do
  new_organs << categories.sample
end

fake_organs = []
id_organ = 0

57.times do
  fake_organs << Organ.create!(name: "#{new_organs[id_organ]} à vendre !", category: new_organs[id_organ], description: Faker::Games::LeagueOfLegends.quote, user: fake_users.sample, pricing: (10000..100000).to_a.sample)
  id_organ += 1
end

puts "#{Organ.count} organs created!"

# For Bookings Creation

puts "Destroying bookings..."
puts "Creating bookings..."
Booking.create!(user: sherazade, organ: poumon, availability: 1)

19.times do
  Booking.create!(user: fake_users.sample, organ: fake_organs.sample, availability: [0, 1, 2].sample)
end

puts "#{Booking.count} bookings created!"

# For Reviews Creation

puts "Destroying reviews..."
puts "Creating reviews..."

15.times do
  Review.create!(comment: Faker::TvShows::GameOfThrones.quote, rating: rand(0..5), organ: fake_organs.sample)
end

puts "#{Review.count} reviews created!"
