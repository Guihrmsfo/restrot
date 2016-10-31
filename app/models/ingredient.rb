class Ingredient < ApplicationRecord
    has_many :ingredients_user
    has_many :user, through: :ingredients_user
    
    validates :name, :presence => true
    validates :unit_of_measure, :presence => true
    
    def create
    end
    
    def update
    end
    
    def delete
    end
end
