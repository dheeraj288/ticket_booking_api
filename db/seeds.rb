# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


category1 = Category.create(name: 'Category 1')
category2 = Category.create(name: 'Category 2')

FoodItem.create(name: 'Food Item 1', category: category1)
FoodItem.create(name: 'Food Item 2', category: category1)
FoodItem.create(name: 'Food Item 3', category: category2)