# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

20.times do |index|
  Product.create(name: Faker::Food.unique.spice, cost: Faker::Number.decimal(r_digits: 2), origin: Faker::Address.country)
end
20.times do |index|
  Product.create(name: Faker::Food.unique.ingredient, cost: Faker::Number.decimal(r_digits: 2), origin: Faker::Address.country)
end
10.times do |index|
  Product.create(name: Faker::House.unique.furniture, cost: Faker::Number.decimal(r_digits: 2), origin: Faker::Address.country)
end

products = Product.all.map { |p| p.id}

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::Name.unique.name , rating: Faker::Number.between(from: 1, to: 5).to_i, content: Faker::Hipster.paragraph_by_chars(characters: 100) , product_id: products[rand(products.length)])

end

p "Created #{Product.count} products!"
p "Created #{Review.count} reviews!"
