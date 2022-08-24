# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying users..."
User.destroy_all
puts "Creating users..."
elea = User.create!(email: "elea@hotmail.fr", password: "secret", username: "Elea")
alexis = User.create!(email: "alexis@hotmail.fr", password: "secret", username: "Alexis")
sherazade = User.create!(email: "sherazade@hotmail.fr", password: "secret", username: "Sherazade")
puts "#{User.count} users created!"

puts "Destroying organs..."
Organ.destroy_all
puts "Creating organs..."
poumon = Organ.create!(name: "Je vends mon poumon", category: "poumon", description: "neuf", user: elea, pricing: 10000)
coeur = Organ.create!(name: "Je vends un coeur trouvé dans une poubelle", category: "poumon", description: "un peu amoché", user: alexis, pricing: 20000)
puts "#{Organ.count} organs created!"

puts "Destroying bookings..."
Booking.destroy_all
puts "Creating bookings..."
Booking.create!(user: sherazade, organ: poumon, availability: 1)
puts "#{Booking.count} bookings created!"
