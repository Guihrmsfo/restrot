class Ingredient < ApplicationRecord
    has_many :ingredients_user
    has_many :user, through: :ingredients_user
    
    validates :nome, :presence => true
    validates :unidade_medida, :presence => true
    
    def create
    end
    
    def update
    end
    
    def delete
    end
end
