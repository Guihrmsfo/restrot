class Recipe < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :favorite_recipes
    has_many :users, through: :favorite_recipes
end
