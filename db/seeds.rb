# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ingredients = Ingredient.create([{name: 'arroz', unit_of_measure: 'xicara'}, {name: 'sal', unit_of_measure: 'pitada'}])
IngredientsUser.create(quantity: 10, ingredient_id: ingredients.first.id, user_id: User.all.first.id)
