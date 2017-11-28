# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Auction.destroy_all
User.destroy_all

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: '123456'
  )
end

users = User.all

50.times.each do
  Auction.create(
    title: Faker::Commerce.product_name,
    details: Faker::Commerce.material,
    end_date: Faker::Date.forward(23),
    price: Faker::Commerce.price,
    user: users.sample
  )
end

auctions = Auction.all



# auctions.each do |auction|
#   rand(0..5).times.each do
#     bid = Bid.create(
#       price: Faker::Commerce.price,
#       user: users.sample
#     )
#   end
# end
