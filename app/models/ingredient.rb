class Ingredient < ApplicationRecord
    has_many :ingredients_user
    has_many :user, through: :ingredients_user
end
