# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

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


categories = ["poumon", "coeur", "rein", "foie", "rate", "estomac", "intestin", "penis", "clitoris", "vessie", "pancréas", "appendice", "vésicule billiaire"]

poumon = Organ.create!(name: "Je vends mon poumon", category: "poumon", description: "neuf", user: elea, pricing: 10000)
coeur = Organ.create!(name: "Je vends un coeur trouvé dans une poubelle", category: "coeur", description: "un peu amoché", user: alexis, pricing: 20000)



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

file = URI.open("https://st3.depositphotos.com/6563466/32179/i/450/depositphotos_321794782-stock-photo-human-body-organs-lungs-anatomy.jpg")
poumon = Organ.new(name: "Je vends mon poumon", category: "Poumon", description: "Poumon neuf prêt à l'emploi", user: elea, pricing: 10000)
poumon.image_url.attach(io: file, filename: "poumon.jpg", content_type: "image/jpg")
poumon.save

file = URI.open("https://st.depositphotos.com/1772771/3829/i/450/depositphotos_38293543-stock-photo-heart.jpg")
coeur = Organ.new(name: "Je vends un coeur trouvé dans une poubelle", category: "Coeur", description: "Un peu amoché", user: alexis, pricing: 20000)
coeur.image_url.attach(io: file, filename: "coeur.jpg", content_type: "image/jpg")
coeur.save

file = URI.open("https://st4.depositphotos.com/1001877/26726/i/450/depositphotos_267265320-stock-photo-large-and-small-intestineisolated-on.jpg")
intestin = Organ.new(name: "Intestin à vendre!", category: "Intestin", description: "Intestin en bon état", user: elea, pricing: 30000)
intestin.image_url.attach(io: file, filename: "intestin.jpg", content_type: "image/jpg")
intestin.save

file = URI.open("https://st2.depositphotos.com/1987851/7369/i/450/depositphotos_73695083-stock-photo-realistic-human-liver-illustration.jpg")
foie = Organ.new(name: "Foie d'un vieux", category: "Foie", description: "Foie bien usé mais en bon état", user: alexis, pricing: 15000)
foie.image_url.attach(io: file, filename: "intestin.jpg", content_type: "image/jpg")
foie.save

file = URI.open("https://st4.depositphotos.com/6563466/30996/i/450/depositphotos_309969042-stock-photo-human-kidneys-digital-illustration-black.jpg")
rein = Organ.new(name: "Reins à vendre!", category: "Reins", description: "Reins en bon état", user: sherazade, pricing: 25000 )
rein.image_url.attach(io: file, filename: "rein.jpg", content_type: "image/jpg")
rein.save

file = URI.open("https://us.123rf.com/450wm/madrock24/madrock242005/madrock24200500052/146832507-anatomie-de-la-rate-humaine-organes-isol%C3%A9s-sur-fond-blanc.jpg?ver=6")
rate = Organ.new(name: "Rate à vendre!", category: "Rate", description: "Rate en très bon état!", user: elea, pricing: 30000)
rate.image_url.attach(io: file, filename: "rate.jpg", content_type: "image/jpg")
rate.save

file = URI.open("https://image.shutterstock.com/image-illustration/3d-human-stomach-anatomy-detail-260nw-1440375524.jpg")
estomac = Organ.new(name: "Estomac à vendre!", category: "Estomac", description: "Estomac en assez bon état", user: sherazade, pricing: 15000)
estomac.image_url.attach(io: file, filename: "estomac.jpg", content_type: "image/jpg")
estomac.save

file = URI.open("https://st4.depositphotos.com/6563466/30996/i/450/depositphotos_309969046-stock-photo-human-bladder-digital-illustration-black.jpg")
vessie = Organ.new(name: "Vessie à vendre!", category: "Vessie", description: "Vessie en super état", user: elea, pricing: 35000)
vessie.image_url.attach(io: file, filename: "vessie.jpg", content_type: "image/jpg")
vessie.save

file = URI.open("https://as2.ftcdn.net/v2/jpg/01/80/94/67/1000_F_180946759_wXMUKcB80dtGwQcI7eie4wW5lOLV8bOu.jpg")
pancreas = Organ.new(name: "Pancréas à vendre!", category: "Pancréas", description: "Pancréas pas top", user: alexis, pricing: 15000)
pancreas.image_url.attach(io: file, filename: "pancreas.jpg", content_type: "image/jpg")
pancreas.save

file = URI.open("https://static.lexpress.fr/medias_12339/w_1621,h_1216,c_crop,x_204,y_67/w_640,h_358,c_fill,g_center/v1628060010/appendix-pain-illustration_6317644.jpg")
appendice = Organ.new(name: "Appendice à vendre!", category: "Appendice", description: "Appendice en bon état", user: elea, pricing: 25000)
appendice.image_url.attach(io: file, filename: "appendice.jpg", content_type: "image/jpg")
appendice.save

file = URI.open("https://st.depositphotos.com/1229718/4883/i/450/depositphotos_48830849-stock-photo-gallbadder.jpg")
vesicule = Organ.new(name: "Vésicule billiaire à vendre!", category: "Vésicule billiaire", description: "Vésicule billiaire en bon état", user: elea, pricing: 15000)
vesicule.image_url.attach(io: file, filename: "vesicule.jpg", content_type: "image/jpg")
vesicule.save

file = URI.open("https://www.francetvinfo.fr/pictures/THtafqrFy5aqIY0-UapFcuUN2ss/fit-in/720x/2017/09/01/phplHG2DL_1.jpg")
clitoris = Organ.new(name: "Clitoris à vendre!", category: "Clitoris", description: "Clitoris en très bon état", user: alexis, pricing: 50000)
clitoris.image_url.attach(io: file, filename: "clitoris.jpg", content_type: "image/jpg")
clitoris.save

file = URI.open("https://i0.wp.com/ae01.alicdn.com/kf/H0eac5c2003644bfda18df593b88cff09V.jpg?fit=510%2C510&ssl=1")
penis = Organ.new(name: "Penis à vendre!", category: "Penis", description: "Penis en super état!!", user: sherazade, pricing: 50000)
penis.image_url.attach(io: file, filename: "penis.jpg", content_type: "image/jpg")
penis.save

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
