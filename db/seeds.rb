# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
User.destroy_all
Car.destroy_all


client = Pexels::Client.new('563492ad6f91700001000001b54f3f1f02f54ee09e3dee72764cc2f4')

car_owner = User.new( first_name: "Jean Paul",
                      last_name: "Deux",
                      email: "jean@jean.com",
                      password: "xxxxxxxx"
)

car_owner.save!


car_renter = User.new( first_name: "Bastien",
  last_name: "Perez Assael",
  email: "bastien@bastien.com",
  password: "xxxxxxxx"
)

car_renter.save!


100.times do
  make_and_model = Faker::Vehicle.make_and_model
  car = Car.new(user_id: car_owner.id,
                title: make_and_model,
                description: Faker::Lorem.paragraph(sentence_count: 9),
                car_type: Faker::Vehicle.car_type,
                price_per_day: rand(15..100),
                mileage: Faker::Vehicle.kilometrage,
                fuel_type: Faker::Vehicle.fuel_type,
                transmission: Faker::Vehicle.transmission,
                year: Faker::Vehicle.year,
                address: Faker::Address.state,
                street_address: "#{Faker::Address.street_address}, #{Faker::Address.city}"
          )
  file = URI.open(client.photos.search("#{make_and_model}", orientation: "landscape", size: "small").first.src["medium"])
  p file
  car.photo.attach(io: file, filename: "car.png", content_type: "image/png")
  car.save!
end
