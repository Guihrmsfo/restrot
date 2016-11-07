class Ingredient < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :ingredients_users
    has_many :users, through: :ingredients_users
    
    validates :name, :presence => true
    validates :unit_of_measure, :presence => true
    
    def create
    end
    
    def update
    end
    
    def delete
    end
end
